# Personal Notes for Aider

- currently works with python3.12 and below
- run a venv with uv and python3.12

## Run architect/editor setup

If you have sonnet via anthropic

```bash
aider --architect --model openrouter/deepseek/deepseek-r1 --editor-model sonnet
```

If you have sonnet via openrouter

```bash
# PAID deepseek version
aider --architect --model openrouter/deepseek/deepseek-r1 --editor-model openrouter/anthropic/claude-3.5-sonnet
# FREE deepseek version - aider v0.73
# NOTE: deepseek free architect works with deepseek free as editor only
aider --architect --model openrouter/deepseek/deepseek-r1:free --editor-model openrouter/anthropic/claude-3.5-sonnet
```

## How to setup GEMINI (google)

- install `google-cloud-sdk`
- run `gcloud init`
- ???
