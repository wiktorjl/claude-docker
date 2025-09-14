#!/bin/bash

set -e

echo "Starting Claude Code container..."

cd /code

echo "Starting Claude Code CLI..."
echo "Working directory: $(pwd)"

# Check if we have OAuth credentials
if [ -f "/home/claude/.claude/.credentials.json" ]; then
    echo "Found OAuth credentials - using existing session"
else
    echo "No OAuth credentials found"
    if [ -n "$CLAUDE_API_KEY" ]; then
        echo "Using API key for authentication"
        export ANTHROPIC_API_KEY="$CLAUDE_API_KEY"
    else
        echo "Warning: No authentication method available"
        echo "Either mount ~/.claude directory or set CLAUDE_API_KEY"
    fi
fi

# Disable potentially problematic features
export DISABLE_TELEMETRY=true
export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=true
export DISABLE_ERROR_REPORTING=true

# Try to skip first-run setup with environment variables
export CLAUDE_SKIP_ONBOARDING=true
export CLAUDE_SKIP_SETUP=true
export CLAUDE_CONFIGURED=true

# Start claude with your existing mounted configuration - no modifications
echo "Starting Claude with your mounted local configuration..."
claude