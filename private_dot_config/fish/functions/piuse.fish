function piuse --description 'pi with the computer-use profile'
    env PI_CODING_AGENT_DIR="$HOME/.pi/profiles/computer-use" \
        PI_CODING_AGENT_SESSION_DIR="$HOME/.pi/sessions" \
        pi $argv
end
