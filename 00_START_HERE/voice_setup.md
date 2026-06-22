# Voice-to-Text Setup (verbal interview practice)

Interviews are verbal → practice verbal. You speak your answer; speech-to-text puts it in the chat;
Claude grades it in **verbal mode** (`_tools/verbal_mode.md`) — judging spoken delivery, not just content.

> Claude can't access your mic. STT happens on your machine; the text lands in the chat box.

## Option A — macOS built-in dictation (use today, zero setup)
1. System Settings → Keyboard → **Dictation** → On (enable the language).
2. In the chat input, press the **🎤 / mic key** (or double-tap **Fn**, or your set shortcut).
3. Speak your answer. It types as you talk. Press the key again to stop. Send.

Pros: instant, free, on-device. Con: can garble ML jargon (NDCG, logits, softmax) — Claude is told to interpret charitably.

## Option B — Local whisper.cpp system (better accuracy for ML terms)
Runs fully local on your Apple Silicon Mac. Best transcription quality.

### Install (one-time)
```bash
brew install whisper-cpp ffmpeg
# download a model (small.en = good accuracy/size tradeoff for ML jargon)
mkdir -p ~/.whisper-models
curl -L -o ~/.whisper-models/ggml-small.en.bin \
  https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-small.en.bin
```

### Use the `dictate` helper
`_tools/dictate.sh` records from your mic until you press Enter, transcribes locally, and copies
the text to your clipboard — then paste into the chat.
```bash
bash ~/Int-Prep/_tools/dictate.sh        # speak, press Enter to stop, text → clipboard
```

## Timing
Currently OFF by choice. When you want it on, tell Claude "enable timing" and it will set spoken
budgets (rapid-fire 60s, concept 90s, deep 2–3min, system design 30–45min).
