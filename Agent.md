# Agentic Configuration for Chezmoi Repository

## Purpose

This document guides agentic tools to:

1. Update `README.md` with current repository status
2. Review the chezmoi repository structure
3. Provide improvement suggestions

## Repository Overview

This is a chezmoi dotfiles management repository that handles personal configuration files across multiple systems with cross-platform support (macOS/Linux, amd64/arm64).

## Key Tasks for Agents

### 1. README.md Maintenance

When updating README.md:

- Always run `git status` first to identify new/modified files
- Add new configuration files to the "設定檔位置" section
- Follow the existing format: `- tool_name` -> `- 設定檔：path`
- Maintain alphabetical ordering where possible
- Use the target path (`~/.config/file`) not the chezmoi source path

### 2. Repository Review Guidelines

Examine these key areas:

- **File Structure**: Check for proper chezmoi naming conventions (`dot_`, `private_`, `executable_`, `.tmpl`)
- **Cross-Platform Support**: Verify templating for macOS/Linux differences
- **Architecture Handling**: Ensure M1/Intel Mac compatibility
- **Security**: Validate sensitive files use `private_` prefix
- **Consistency**: Check naming patterns and organization

### 3. Suggestion Categories

Provide suggestions for:

- **Missing Configurations**: Common tools that should be included
- **Template Improvements**: Better cross-platform handling
- **Security Enhancements**: Files that should be marked private
- **Organization**: Better directory structure or file grouping
- **Documentation**: Missing explanations or setup instructions

## Commands for Analysis

Essential commands for repository review:

- `git status` - Check for untracked/modified files
- `chezmoi status` - Compare source vs target state
- `chezmoi diff` - Preview changes before applying
- `find . -name "*.tmpl"` - List templated files
- `find . -name "private_*"` - List private files

## Update Workflow

1. Run `git status` to identify changes
2. Update README.md with new configuration files
3. Review file naming conventions
4. Check for missing documentation
5. Suggest improvements based on best practices
6. Ensure security considerations are met

## Best Practices

- Always preserve existing Chinese language in README.md
- Maintain consistent formatting and structure
- Consider cross-platform implications for new configs
- Use templating for environment-specific settings
