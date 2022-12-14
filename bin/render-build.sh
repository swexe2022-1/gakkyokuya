#!/usr/bin/env bash
# exit on error set -o errexit
bundle install
yarn install
bundle exec rake assets:precompile
bundle exec rake assets:clean
budnle exec rake db:drop
bundle exec rake db:migrate
bundle exec rake db:seed
