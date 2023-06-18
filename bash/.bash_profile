source ~/.profile

# need this for the gcloud
if [[ "$OSTYPE" == "darwin"* ]]; then
  # The next line updates PATH for the Google Cloud SDK.
  if [ -f '/Users/jkyvetos/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/Users/jkyvetos/Downloads/google-cloud-sdk/path.bash.inc'; fi
  # The next line enables shell command completion for gcloud.
  if [ -f '/Users/jkyvetos/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/jkyvetos/Downloads/google-cloud-sdk/completion.bash.inc'; fi
fi