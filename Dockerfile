FROM mcr.microsoft.com/devcontainers/typescript-node:20-bookworm

# change user
USER node

# add pnpm
RUN sudo corepack enable && sudo corepack prepare pnpm@latest --activate

# repository
WORKDIR /app

# update env
ENV PNPM_HOME /app/.pnpm-store/v3
ENV PATH $PNPM_HOME:$PATH

EXPOSE 3000

# entrypoint
CMD ["/bin/bash"]

