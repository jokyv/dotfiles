# old conig
# aider --architect --model vertex_ai/gemini-2.0-flash-thinking-exp-01-21 --editor-model vertex_ai/gemini-2.0-flash-exp --weak-model vertex_ai/gemini-2.0-flash-exp --editor-edit-format diff

aider \
  --architect \
  --model vertex_ai/gemini-2.0-flash-thinking-exp-01-21 \
  --editor-model vertex_ai/gemini-2.5-pro-exp-03-25 \
  # --editor-model vertex_ai/gemini-2.0-pro-exp-02-05 \
  --weak-model vertex_ai/gemini-2.0-flash-exp \
  --editor-edit-format whole

# newest config but gemini 2.5 not available in vertex right now
# aider \
#   --architect \
#   --model vertex_ai/gemini-2.5-pro-exp-03-25 \
#   --editor-model vertex_ai/gemini-2.0-pro-exp-02-05 \
#   --weak-model vertex_ai/gemini-2.0-flash-exp \
#   --editor-edit-format whole

# testing
# aider \
#   --model vertex_ai/gemini-2.5-pro-exp-03-25 \
#   --editor-edit-format diff-fenced
