require 'bundler/capistrano'

require "rvm/capistrano"

load 'deploy' if respond_to?(:namespace) # cap2 differentiator

# Uncomment if you are using Rails' asset pipeline
load 'deploy/assets'

Dir['vendor/gems/*/recipes/*.rb','vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

load 'config/deploy' # remove this line to skip loading any of the default tasks

require 'thinking_sphinx/deploy/capistrano'
require "whenever/capistrano"
require 'capistrano/ext/multistage'
require 'capi/unicorn'
