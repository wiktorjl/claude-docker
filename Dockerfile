FROM node:18-slim

RUN apt-get update && apt-get install -y \
    curl \
    git \
    sudo \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g @anthropic-ai/claude-code

ARG USER_ID=1000
ARG GROUP_ID=1000

RUN existing_user=$(getent passwd $USER_ID | cut -d: -f1) && \
    if [ -n "$existing_user" ]; then \
        usermod -l claude -d /home/claude -m $existing_user && \
        groupmod -n claude $(getent group $GROUP_ID | cut -d: -f1); \
    else \
        groupadd -g $GROUP_ID claude && \
        useradd -m -s /bin/bash -u $USER_ID -g $GROUP_ID claude; \
    fi && \
    echo "claude ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER claude

ENV CLAUDE_CONFIG_DIR=/home/claude/.claude
RUN mkdir -p $CLAUDE_CONFIG_DIR
WORKDIR /code

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
USER root
RUN chmod +x /usr/local/bin/entrypoint.sh
USER claude

EXPOSE 3000

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]