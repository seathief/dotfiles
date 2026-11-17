# Pi agent profiles
pisurvey() {
  PI_CODING_AGENT_DIR="$HOME/.pi/profiles/survey" \
  PI_CODING_AGENT_SESSION_DIR="$HOME/.pi/sessions" \
  command pi "$@"
}
