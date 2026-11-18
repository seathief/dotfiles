# Pi agent profiles
picoding() {
  PI_CODING_AGENT_DIR="$HOME/.pi/profiles/coding" \
  PI_CODING_AGENT_SESSION_DIR="$HOME/.pi/sessions" \
  command pi "$@"
}

pisurvey() {
  PI_CODING_AGENT_DIR="$HOME/.pi/profiles/survey" \
  PI_CODING_AGENT_SESSION_DIR="$HOME/.pi/sessions" \
  command pi "$@"
}

piuse() {
  PI_CODING_AGENT_DIR="$HOME/.pi/profiles/computer-use" \
  PI_CODING_AGENT_SESSION_DIR="$HOME/.pi/sessions" \
  command pi "$@"
}
