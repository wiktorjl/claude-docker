# Claude Code Docker

This is a dockerized Claude Code instance that:

- Mounts your local code directory inside the container at `/code`
- Uses a separate Docker-specific configuration directory (`./claude-docker-config/`)
- Copies your existing OAuth credentials and settings for seamless authentication
- Preserves your local `~/.claude` configuration untouched
- Provides the same Claude Code experience in an isolated container environment

## Usage

Run `./claude-docker` from any project directory to launch Claude Code in a container with:
- Your project files mounted and accessible
- Your existing authentication (no re-login required)
- Isolated configuration that doesn't affect your local setup

