function picoding --description 'pi with the coding profile'
    env PI_CODING_AGENT_DIR="$HOME/.pi/profiles/coding" \
        PI_CODING_AGENT_SESSION_DIR="$HOME/.pi/sessions" \
        pi $argv
end
