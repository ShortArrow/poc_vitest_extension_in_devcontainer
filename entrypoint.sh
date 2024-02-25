#!/bin/bash

# permissions
sudo chown -R node:node /app
sudo chmod -R 755 /app
sudo chown -R node:node /app
sudo find /app -type d -exec chmod 755 {} \;
sudo find /app -type f -exec chmod 644 {} \;
sudo chmod +x /app/entrypoint.sh

# git
chown -R node /app/.git 
chmod -R ug+rwX,o+rX,o-w /app/.git
git config --global --add safe.directory /app
git config --global --add safe.directory /app/design

# pnpm
pnpm config set store-dir /app/.pnpm-store/v3
pnpm install

# biome 
chmod +x  /app/node_modules/.pnpm/@biomejs*/node_modules/@biomejs/cli*/biome

# start
pnpm dev --host
