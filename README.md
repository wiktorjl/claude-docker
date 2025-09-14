# Claude Code Docker

A Dockerized environment for running Claude Code CLI that mounts your local code directory inside the container.

## Quick Start (Alias Method)

1. **Set your API key:**
   ```bash
   export CLAUDE_API_KEY=your_anthropic_api_key_here
   ```

2. **Create an alias:**
   ```bash
   alias claude-code='/path/to/claude-docker/claude-docker'
   ```

3. **Use from any directory:**
   ```bash
   cd /your/project
   claude-code
   ```

The container will start and drop you into the Claude Code CLI interface.

## Setup

### Prerequisites
- Docker and Docker Compose
- Anthropic API key

### Configuration

1. Copy the example environment file:
   ```bash
   cp .env.example .env
   ```

2. Edit `.env` with your settings:
   ```bash
   CLAUDE_API_KEY=your_anthropic_api_key_here
   CODE_PATH=$(pwd)  # Path to your code directory (defaults to current directory)
   CLAUDE_CODE_PORT=3000
   CLAUDE_CODE_HOST=0.0.0.0
   ```

### Usage

The container will:
- Mount your local code directory at `/code`
- Install and configure Claude Code CLI
- Start the interactive Claude Code CLI
- Persist configuration in a Docker volume

### Alternative: Manual Scripts

For traditional usage with start/stop scripts:
```bash
./start.sh  # Start container
./stop.sh   # Stop container
```

### Manual Commands

Build and run manually:
```bash
docker compose up --build
```

Access container shell:
```bash
docker compose exec claude-code bash
```

## File Structure

- `Dockerfile` - Container definition
- `docker-compose.yml` - Service configuration
- `entrypoint.sh` - Container startup script
- `start.sh` - Quick start script
- `stop.sh` - Stop script
- `.env.example` - Environment variables template