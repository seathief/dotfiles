function piflare --description 'Pi with only the Cloudflare One skill'
    # Management subcommands must precede interactive-only options.
    switch "$argv[1]"
        case auth config install remove update list mcp
            env PI_CODING_AGENT_DIR="$HOME/.pi/profiles/cloudflare" \
                PI_CODING_AGENT_SESSION_DIR="$HOME/.pi/sessions" \
                pi $argv
            return $status
    end

    env PI_CODING_AGENT_DIR="$HOME/.pi/profiles/cloudflare" \
        PI_CODING_AGENT_SESSION_DIR="$HOME/.pi/sessions" \
        pi --no-skills --skill "$HOME/.pi/profiles/cloudflare/skills/cloudflare-one" \
        --no-extensions --no-prompt-templates --no-themes $argv
end
