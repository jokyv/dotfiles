# old conig
# aider --architect --model vertex_ai/gemini-2.0-flash-thinking-exp-01-21 --editor-model vertex_ai/gemini-2.0-flash-exp --weak-model vertex_ai/gemini-2.0-flash-exp --editor-edit-format diff

aider \
  --architect \
  --model vertex_ai/gemini-2.0-flash-thinking-exp-01-21 \
  --editor-model vertex_ai/gemini-2.0-pro-exp-02-05 \
  --weak-model vertex_ai/gemini-2.0-flash-exp \
  --editor-edit-format whole

# newest config
# aider \
#   --architect \
#   --model vertex_ai/gemini-2.5-pro \
#   --editor-model vertex_ai/gemini-2.0-pro-exp-02-05 \
#   --weak-model vertex_ai/gemini-2.0-flash-exp \
#   --editor-edit-format whole
