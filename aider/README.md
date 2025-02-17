# Notes for Aider

## Workflow

- Start aider in architect mode
- Add only the files that are relevant to what you want to do.
- You can add comment to create new functionality for aider to know where to add code as `# expander here` comment
- Or when you want to update a function name the function on that specific file. Aider has already created a map of everything
- Press `/tokens` to report the number of tokens used by the current chat context.
- Press `/clear` to reset and clear the prompt.

## General notes

- Currently works with python3.12 and below
- How to install:
  - Run a venv with uv and python3.12 as `uv venv talk_to_ai -p python3.12`
  - Activate env as `source talk_to_ai/bin/activate`
  - Then run `uv pip install aider-chat[help]`
- best architect model in terms of value per dollar is currently: `openrouter/deepseek/deepseek-r1`
- You should prefer `diff` edit format for the editor model as it uses less tokens
  - add `--editor-edit-format diff` into the initial `aider` command.
  - or have it in your aider config file.

## Run architect/editor setup

### If you have sonnet via anthropic

```bash
aider --architect --model openrouter/deepseek/deepseek-r1 --editor-model sonnet
```

### If you have sonnet via openrouter

```bash
# PAID deepseek version
aider --architect --model openrouter/deepseek/deepseek-r1 --editor-model openrouter/anthropic/claude-3.5-sonnet
# FREE deepseek version - aider v0.73
# NOTE: deepseek free architect works with deepseek free as editor only
aider --architect --model openrouter/deepseek/deepseek-r1:free --editor-model openrouter/anthropic/claude-3.5-sonnet
```

## GEMINI (google)

### How to set it up first

- install `google-cloud-sdk`
- run `gcloud init`
- export VERTEXAI_PROJECT=<PROJECT ID>
- export VERTEXAI_LOCATION=us-central1

### If you have to work with only gemini

- Strong reasoning model as architect (model `thinking`)
- Strong coding model as editor
- Week model the cheapest option, something cheap or free model

```bash
aider --architect --model vertex_ai/gemini-2.0-flash-thinking-exp-01-21 --editor-model vertex_ai/gemini-2.0-flash-exp --weak-model vertex_ai/gemini-2.0-flash-exp --editor-edit-format diff
```

## Commands and changes from your IDE instead of terminal

- start as `aider --watch-files`
- comment as `# add documentation to this function. AI?`
- or long form instructions as:

```python
# Make these changes: AI?
# - add a proper main() function
# - accept --host and --port args
```

## Specifying coding conventions

- `/read CONVENTIONS.md` or `aider --read CONVENTIONS.md`
- always read conventions:
  - add to file .aider.conf.yml
  ```yaml
  # alone
  read: CONVENTIONS.md

  # multiple files
  read: [CONVENTIONS.md, anotherfile.txt]
  ```
