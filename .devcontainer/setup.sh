#!/bin/bash

set -eou pipefail

echo "Installing Postgres 14 Client in devcontainer"
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/postgresql-pgdg.list > /dev/null

sudo apt-get update
sudo apt-get -y install bash-completion postgresql-client

pip3 install -r /workspace/requirements.txt
ln -s /workspace/.sqlfluff* ~/

cd /workspace && make setup-source-db
