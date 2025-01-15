#!/usr/bin/env bash

# Enable detailed logging
set -ex

# Install dependencies
bundle install

# Precompile assets
bundle exec rake assets:precompile

# Migrate the database
bundle exec rake db:migrate

# Build JavaScript assets
yarn build

# Start Puma server
bundle exec puma -C config/puma.rb
