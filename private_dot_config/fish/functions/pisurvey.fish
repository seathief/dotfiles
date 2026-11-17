function pisurvey --description 'pi with the survey profile'
    env PI_CODING_AGENT_DIR="$HOME/.pi/profiles/survey" \
        PI_CODING_AGENT_SESSION_DIR="$HOME/.pi/sessions" \
        pi $argv
end
