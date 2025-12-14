-- Import stems from folder and add as takes to template tracks
-- Audio as usual; MIDI as FILE REFERENCES (not embedded).

---------------------------------------
-- CATEGORY MAPPING (same as before) --
---------------------------------------
local CATEGORIES = {
  { "Vocals (Backing)", { {"vocal", "voice"}, {"backing"} } },
  { "Vocals (Lead)",    { {"vocal", "voice"}, {"lead"} } },
  { "Drums (Hihat)",    { {"hh", "hihat", "hat"} } },
  { "Drums (Kick)",     { {"kick"} } },
  { "Drums (Ride)",     { {"ride"} } },
  { "Drums (Snare)",    { {"snare"} } },
  { "Drums (Crash)",    { {"crash"} } },
  { "Drums (Toms)",     { {"toms"} } },
  { "Drums (Percussion)", { {"percussion"} } },
  { "Drums (Other)",    { {"drums"}, {"other"} } },
  { "Guitar (Lead)",    { {"lead"} } },
  { "Guitar (Rhythm)",  { {"rhythm"} } },
  { "Guitar (Acoustic)",{ {"acoustic"} } },
  { "Guitar (Electric)",{ {"electric"} } },
  { "Instrumental",     { {"instrumental", "instrum"} } },
  { "Bass",             { {"bass"} } },
  { "Vocals",           { {"vocals", "voice"} } },
  { "Guitar",           { {"guitar"} } },
  { "Piano",            { {"piano", "keyboard", "organ"} } },
  { "Strings",          { {"strings"} } },
  { "Drums",            { {"drums"} } },
  { "Synth",            { {"synth"} } },
  { "FX",               { {"fx", "effects"} } },
  { "Brass",            { {"brass"} } },
  { "Winds",            { {"woodwinds", "flute", "clarinet", "wind"} } },
  { "Other",            { {"other", "melodics"} } },
}

----------------
-- CONFIG ------
----------------

local VALID_EXT = {
  wav=true, flac=true, mp3=true, ogg=true,
  aif=true, aiff=true, wv=true,
  mid=true, midi=true
}

local ITEM_START_POS = 0.0

----------------
-- UTILS -------
----------------

local function tolower(s) return (s or ""):lower() end

local function split_path(path)
  local name = path:match("([^/\\]+)$") or path
  local base = name:match("(.+)%.[^%.]+$") or name
  return name, base
end

local function get_ext(path)
  local ext = path:match("%.([^%.]+)$")
  return ext and ext:lower() or ""
end

local function is_valid_media_file(path)
  local ext = get_ext(path)
  return VALID_EXT[ext] == true
end

local function categorize_filename(filename)
  local lower = tolower(filename)

  for _, cat in ipairs(CATEGORIES) do
    local cat_name = cat[1]
    local groups   = cat[2]
    local all_groups_match = true

    for _, group in ipairs(groups) do
      local group_match = false
      for _, kw in ipairs(group) do
        if lower:find(tolower(kw), 1, true) ~= nil then
          group_match = true
          break
        end
      end
      if not group_match then
        all_groups_match = false
        break
      end
    end

    if all_groups_match then
      return cat_name
    end
  end

  return "Other"
end

local function scan_folder(path, files)
  local sep = package.config:sub(1,1) or "/"

  -- files
  local i = 0
  while true do
    local fn = reaper.EnumerateFiles(path, i)
    if not fn then break end
    local full = path .. sep .. fn
    if is_valid_media_file(full) then
      files[#files+1] = full
    end
    i = i + 1
  end

  -- subdirectories
  local j = 0
  while true do
    local sub = reaper.EnumerateSubdirectories(path, j)
    if not sub then break end
    local fullsub = path .. sep .. sub
    scan_folder(fullsub, files)
    j = j + 1
  end
end

local function build_track_map()
  local map = {}
  local num_tracks = reaper.CountTracks(0)
  for i = 0, num_tracks-1 do
    local tr = reaper.GetTrack(0, i)
    local ok, name = reaper.GetSetMediaTrackInfo_String(tr, "P_NAME", "", false)
    if ok and name ~= "" then
      local key = tolower(name)
      if not map[key] then
        map[key] = { track = tr }
      end
    end
  end
  return map
end

--------------------------
-- MAIN ------------------
--------------------------

reaper.Undo_BeginBlock()
reaper.PreventUIRefresh(1)

local proj_path = reaper.GetProjectPath("")
local ret, input = reaper.GetUserInputs("Folder with stems", 1,
  "Folder path (blank = project dir):",
  proj_path or "")

if not ret then
  reaper.PreventUIRefresh(-1)
  reaper.Undo_EndBlock("Import stems to template tracks (cancelled)", -1)
  return
end

local folder = input
if folder == "" then folder = proj_path end

local files = {}
scan_folder(folder, files)

if #files == 0 then
  reaper.PreventUIRefresh(-1)
  reaper.ShowMessageBox("No audio or MIDI files found in:\n" .. folder,
                        "Import stems", 0)
  reaper.Undo_EndBlock("Import stems to template tracks (no files)", -1)
  return
end

local track_map = build_track_map()
local other_key = tolower("Other")
local other_entry = track_map[other_key]

local category_items = {}

local function get_track_for_category(cat_name)
  local key = tolower(cat_name)
  local entry = track_map[key]
  if entry and entry.track then return entry.track end

  if cat_name ~= "Other" and other_entry and other_entry.track then
    return other_entry.track
  end

  return nil
end

local function get_item_for_category(cat_name)
  local info = category_items[cat_name]
  if info and info.item and reaper.ValidatePtr(info.item, "MediaItem*") then
    return info.item
  end

  local tr = get_track_for_category(cat_name)
  if not tr then return nil end

  local item = reaper.AddMediaItemToTrack(tr)
  if not item then return nil end

  reaper.SetMediaItemInfo_Value(item, "D_POSITION", ITEM_START_POS)
  -- NOTE: we do NOT force D_LENGTH to 0 here; we’ll let it grow as we add takes

  info = { track = tr, item = item }
  category_items[cat_name] = info
  return item
end

local added_count = 0
local classified_as_other = 0

for _, path in ipairs(files) do
  local _, base = split_path(path)
  local cat_name = categorize_filename(base)
  local item = get_item_for_category(cat_name)

  if item then
    local ext = get_ext(path)
    local src

    if ext == "mid" or ext == "midi" then
      -- Force MIDI as FILE REFERENCE, not embedded project MIDI
      -- forcenoMidiImp=true ensures it doesn’t import as in-project data
      src = reaper.PCM_Source_CreateFromFileEx(path, true)
    else
      src = reaper.PCM_Source_CreateFromFile(path)
    end

    if src then
      local take = reaper.AddTakeToMediaItem(item)
      reaper.SetMediaItemTake_Source(take, src)
      reaper.GetSetMediaItemTakeInfo_String(take, "P_NAME", base, true)

      -- Extend item length based on source length when available
      local len = reaper.GetMediaSourceLength(src)
      if len and len > 0 then
        local cur_len = reaper.GetMediaItemInfo_Value(item, "D_LENGTH")
        if len > cur_len then
          reaper.SetMediaItemInfo_Value(item, "D_LENGTH", len)
        end
      end

      added_count = added_count + 1
      if cat_name == "Other" then
        classified_as_other = classified_as_other + 1
      end
    end
  end
end

reaper.UpdateArrange()
reaper.PreventUIRefresh(-1)
reaper.Undo_EndBlock("Import stems to template tracks", -1)

reaper.ShowMessageBox(
  string.format(
    "Imported %d files as takes.\nUnclassified/Other: %d\nFolder: %s",
    added_count, classified_as_other, folder
  ),
  "Import stems",
  0
)

