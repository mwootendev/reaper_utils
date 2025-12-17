Here is a comprehensive guide to your "Gold Standard" plugins.

---

### **1. FabFilter Pro-Q 4 (EQ)**
**Description:** The industry-standard equalizer. It is loved because it offers a large, interactive visual display where you can see the frequency spectrum in real-time and grab specific peaks to adjust them.
**Primary Use:** Surgical cleanup (removing mud/harshness), tonal shaping, and dynamic equalization.

**Key Options & Parameters:**
*   **Frequency:** Determines where on the spectrum (20Hz to 20kHz) you are adjusting.
*   **Gain:** How much you boost (louder) or cut (quieter) that frequency.
*   **Q (Bandwidth):** Controls how wide the bell is. A High Q (narrow) is for surgical cuts; a Low Q (wide) is for gentle tonal shifts.
*   **Shape:** Changes the filter type.
    *   *Bell:* Standard boost/cut.
    *   *Low/High Cut:* Removes everything below/above a point (essential for cleaning low-end rumble).
    *   *Low/High Shelf:* Boosts/cuts everything above or below the point equally.
*   **Dynamic Range (The Ring around the Gain knob):** This turns a static EQ band into a compressor/expander. If you pull the ring down, it will only cut that frequency *when it gets too loud*. Essential for taming harsh vocals only when the singer screams.
*   **Stereo Placement:** Allows you to EQ the "Mid" (center information) separately from the "Side" (stereo width). Great for cutting mud out of the sides to make the mix wider.

---

### **2. FabFilter Pro-C 2 (Compressor)**
**Description:** A highly visual compressor that shows you exactly when and how much volume is being reduced. It is incredibly transparent but can be aggressive if needed.
**Primary Use:** Controlling dynamics on vocals, drums, and the Master Bus.

**Key Options & Parameters:**
*   **Threshold:** The volume level at which the compressor turns on. If the audio is quieter than this, nothing happens. Lower the threshold to compress more.
*   **Ratio:** How much the volume is reduced once it crosses the threshold.
    *   *2:1 to 4:1:* Standard for vocals/bass.
    *   *10:1:* Heavy limiting (drums).
*   **Attack:** How fast the compressor reacts. Fast attack (0.1ms) kills drum transients; Slow attack (30ms+) lets the "punch" through.
*   **Release:** How fast the compressor lets go. Fast release creates volume/energy; slow release creates smoothness.
*   **Style:** Changes the algorithm.
    *   *Vocal:* Automatic settings optimized for singing.
    *   *Bus:* The "glue" setting for groups of instruments.
    *   *Punch:* Aggressive, good for drums.
*   **Wet Gain / Dry Mix:** Allows for "Parallel Compression" (mixing the uncompressed signal with the compressed one) inside the plugin.

---

### **3. FabFilter Pro-L 2 (Limiter)**
**Description:** A brickwall limiter used to increase the overall loudness of a track without allowing it to "clip" (distort digitally).
**Primary Use:** The final plugin on your Master Bus (2-Bus).

**Key Options & Parameters:**
*   **Gain:** The big slider. Push this up to make your song louder. The plugin automatically stops it from peaking.
*   **Output Level:** The "Ceiling." Set this to **-1.0 dB** or **-0.5 dB** for streaming services to prevent distortion when they convert your file to MP3/AAC.
*   **Lookahead:** The limiter "looks into the future" to catch peaks before they happen. A short lookahead preserves transients but might distort; a longer lookahead is cleaner but smooths out the impact.
*   **Style:**
    *   *Modern:* The default. Transparent and loud.
    *   *Aggressive:* Great for EDM/Metal.
    *   *Safe:* Good for classical or jazz where you don't want distortion.
*   **True Peak Limiting:** Turn this **ON**. It ensures that even the inter-sample peaks (invisible peaks that happen between digital samples) don't clip.

---

### **4. IK Multimedia Black 76 (FET Compressor)**
**Description:** An emulation of the legendary **Urei 1176**. It is an FET (Field Effect Transistor) compressor known for being incredibly fast and adding a pleasant grit.
**Primary Use:** Snare drums, Rock Vocals, aggressive Bass.

**Key Options & Parameters:**
*   **Input:** **Crucial:** This plugin has no "Threshold." You turn up the Input to drive the signal *into* a fixed threshold. The more you turn up Input, the more compression you get.
*   **Output:** Use this to turn the volume back down after boosting the Input.
*   **Attack:** Controls speed. **NOTE:** The 1176 works backward compared to other plugins. **7 is FASTEST, 1 is SLOWEST.**
*   **Release:** Controls recovery speed. Same rule: 7 is Fast, 1 is Slow.
*   **Ratio:** Buttons for 4, 8, 12, 20, or "All." Higher numbers = harder compression. The "All" button mode creates a smashed, distorted, explosive sound (famous on drum rooms).

---

### **5. IK Multimedia White 2A (Opto Compressor)**
**Description:** An emulation of the **Teletronix LA-2A**. It uses an optical cell (light) to control volume. It is slow, musical, and impossible to make sound bad.
**Primary Use:** Smoothing out Vocals and Bass guitar.

**Key Options & Parameters:**
*   **Peak Reduction:** The "Compression" knob. Turn it up until the meter needle tickles between -3dB and -5dB.
*   **Gain:** The make-up volume. Turn this up to match the volume level when the plugin is bypassed.
*   **Limit / Compress Switch:** Almost always leave this on **Compress**. "Limit" changes the ratio to infinity and is usually too harsh for mixing.

---

### **6. IK Multimedia Sunset Sound Studio Reverb**
**Description:** A convolution reverb that places your audio into the actual rooms of Sunset Sound Studios in Los Angeles (where Led Zeppelin, Prince, and The Rolling Stones recorded).
**Primary Use:** Giving digital instruments realistic space.

**Key Options & Parameters:**
*   **Studio (1, 2, 3):** Selects which physical studio room you want to use. Studio 2 is famous for its "dead" drum sound; Studio 3 is famous for Prince vocals.
*   **Room Type (Live Room, Iso, Chamber, Plate):**
    *   *Live Room:* Great for drums.
    *   *Plate:* The classic smooth vocal reverb.
    *   *Chamber:* A physical echo room, great for strings and big vocals.
*   **Decay:** How long the reverb tail lasts.
*   **Pre-Delay:** A time gap before the reverb starts. essential for vocals—it lets the dry vocal punch through before the wash of reverb starts.

---

### **7. IK Multimedia Tape Machine 80**
**Description:** Emulates the **Studer A80**, a classic multitrack tape recorder from the 70s/80s. It is known for a "clean but thick" sound.
**Primary Use:** "Glue" on the Master Bus or Drum Bus.

**Key Options & Parameters:**
*   **IPS (Inches Per Second):** Tape speed.
    *   *15 IPS:* Rolls off high treble, boosts bass ("head bump"). Good for Hip Hop/Rock.
    *   *30 IPS:* High fidelity, cleaner top end. Good for Pop/Modern.
*   **Bias:** Controls the calibration. Higher bias is warmer/duller; lower bias is brighter/grittier.
*   **Input:** Drive this to get "Tape Saturation" (natural compression and harmonic distortion).
*   **Repro / Input:** Always set to **Repro**. This runs the audio through the tape emulation head. "Input" bypasses the tape circuit.

---

### **8. VocAlign 6 Standard**
**Description:** An automated editing tool that takes a "Dub" track (like a background vocal) and stretches/compresses it to match the timing of a "Guide" track (Lead vocal).
**Primary Use:** Tightening stacked vocals or matching a bass guitar to a kick drum.

**Key Options & Parameters:**
*   **Guide:** The slot where you capture the "correct" audio (Lead Vocal).
*   **Dub:** The slot where you capture the "messy" audio (Background Vocal).
*   **Alignment Preset:**
    *   *Tight:* Locks every syllable perfectly (good for Pop).
    *   *Normal/Loose:* Keeps some human variation (good for Rock/Folk).
*   **Process/Render:** The button that calculates the new timing and prints the audio.

---

### **9. Voxengo SPAN (Analysis)**
**Description:** A real-time Fast Fourier Transform (FFT) spectrum analyzer. It shows you the volume of every frequency in your audio.
**Primary Use:** Visualizing frequency clashes (e.g., Kick vs. Bass) and overall mix balance.

**Key Options & Parameters:**
*   **Mode:**
    *   *Stereo:* Shows Left and Right.
    *   *Mid-Side:* Shows Center (Mid) and Sides. Use this to see if your bass is wandering into the stereo field (bad) or if your high-end is wide enough (good).
*   **Block Size:** The resolution of the graph. Set to **8192** or higher to accurately see low-end frequencies (bass notes).
*   **Slope:** Usually set to **3dB or 4.5dB**. This tilts the graph so that "Pink Noise" looks flat, which represents how human ears perceive balance.

---

### **10. Native Instruments Replika (Delay)**
**Description:** A streamlined, creative delay unit that blends simple echoing with diffusion and modulation.
**Primary Use:** Creating depth, rhythmic interest, or "washed out" ambient textures.

**Key Options & Parameters:**
*   **Time:** The speed of the echo. Usually synced to the DAW (1/4 note, 1/8 dotted).
*   **Feedback:** How many times the echo repeats. 0 = one echo. 100 = infinite loop.
*   **Low Cut / High Cut:** Essential filters.
    *   *Low Cut:* Thins out the echo so it doesn't mud up the bass.
    *   *High Cut:* Darkens the echo so it sits behind the lead vocal.
*   **Mode:**
    *   *Modern:* Crystal clean digital delay.
    *   *Vintage:* Darker, degraded digital delay.
    *   *Diffusion:* Blurs the echoes, turning the delay into a reverb-like wash.

---

### **11. Scaler 3 (Composition)**
**Description:** A music theory workstation. It listens to MIDI or Audio input, detects the key/scale, and suggests chords that fit.
**Primary Use:** Writing chord progressions, finding melodies, and fixing MIDI performances to stay in key.

**Key Options & Parameters:**
*   **Detect:** Listens to your playing and tells you "You are in C Minor."
*   **Scales:** Allows you to browse moods (e.g., "Lydian," "Blues," "J-Pop").
*   **Chord Sets:** Pre-made progressions by genre.
*   **Performance:** The best feature. You can press one key, and Scaler will play a complex chord, strum it like a guitar, or play an arpeggio pattern automatically.
*   **MIDI Capture:** Records the output of Scaler so you can drag the MIDI notes onto your DAW timeline.

---

### **12. MixChecker Ultra (Utility)**
**Description:** An acoustic simulator that models consumer listening devices.
**Primary Use:** Checking translation. "Does my mix still sound good on an iPhone?"

**Key Options & Parameters:**
*   **Device Buttons:** Selects the simulation (iPhone, Laptop, Car, Mono TV, Bluetooth Speaker, Earbuds).
*   **Environment / Noise:** Adds background noise (street traffic, subway, mall). This checks if your vocal is loud enough to be heard over real-world noise.
*   **Distortion:** Simulates a blown speaker to see if your 808 bass is too loud for cheap devices.

---

### **13. JS: Loudness Meter Peak/RMS/LUFS**
**Description:** A native Reaper plugin for metering loudness standards.
**Primary Use:** Ensuring your Master output hits the target volume for streaming services (usually -14 LUFS).

**Key Options & Parameters:**
*   **LUFS-I (Integrated):** The most important number. This is the average loudness of your *entire* song from start to finish.
    *   *Target:* Approx -14 for Spotify, -9 to -7 for CD/Club loudness.
*   **LUFS-S (Short Term):** The loudness of the last 3 seconds. Watch this during the loudest chorus.
*   **True Peak:** The highest instantaneous volume spike. This should never cross 0.0dB (ideally keep it under -1.0dB).