# Notes for Aider

## Workflow

- Start aider in architect mode
- Add only the files that are relevant to what you want to do.
- You can add comment/expander for new functionality for aider to know where to add code as `# expander here` comment.
- Or when you want to update a function, name the function on that specific file. Aider has already created a map of everything.
- Press `/tokens` to report the number of tokens used by the current chat context.
- Press `/ask` to discuss with LLM and aider regarding what you want to do.
  - Questions: Does it change from architect mode though?
- Press `/clear` - Clear the chat history.
- Press `/reset` - Drop all files and clear the chat history.
- Press `/load <FILE>` - load a file full od prompt instructions all at once.
  - create a template that can be re-used.

## General notes

- Currently works with python3.12 and below
- How to install:
  - Run a venv with uv and python3.12 as `uv venv talk_to_ai -p python3.12` at $HOME.
  - Activate env as `source talk_to_ai/bin/activate`
  - Then run `uv pip install aider-chat[help]`
- best architect/reasoning model in terms of value per dollar is currently: `deepseek-r1` followed by `o3-mini`
- You should prefer `diff` edit format for the editor model as it uses less tokens.
  - add `--editor-edit-format diff` into the initial `aider` command.
  - or even better have it in your aider config file.

## Run architect/editor setup

- Best for coding with sonnet
- Best for Architect mode, reasoning models such as deepseek or o3-mini

### Examples:

If you have sonnet via anthropic.

```bash
aider --architect --model openrouter/deepseek/deepseek-r1 --editor-model sonnet
```

```bash
aider --architect --model openai/o3-mini --editor-model sonnet
```

If you have sonnet via openrouter

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

- Strong reasoning model as architect (model: `thinking`)
- Strong coding model as editor
- Week model the cheapest possible option.

```bash
aider --architect --model vertex_ai/gemini-2.0-flash-thinking-exp-01-21 --editor-model vertex_ai/gemini-2.0-flash-exp --weak-model vertex_ai/gemini-2.0-flash-exp --editor-edit-format diff
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

## Consider this!

- linting using `ruff check --fix` (fix any fixable errors), how to do it?
- `--cache-prompts` Aider supports prompt caching for cost savings and faster coding.
  - Currently Anthropic provides caching for Sonnet and Haiku, and DeepSeek provides caching for Chat.
- `--no-detect-urls` no detection and offering to add URLs to chat (default: True)
- `--no-auto-commits` no auto commit of LLM changes (default: True)
- start as `aider --watch-files`
  - comment as `# add documentation to this function. AI?`
  - or long form instructions as:
  ```python
  # Make these changes: AI?
  # - add a proper main() function
  # - accept --host and --port args
  ```
