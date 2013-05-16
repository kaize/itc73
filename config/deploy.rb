set :stages, %w(production staging)
set :default_stage, "staging"

require 'capistrano/ext/multistage'
require 'airbrake/capistrano'

set :application, "itc73"
set :rvm_type, :system

set :scm, :git
set :repository,  "git@github.com:kaize/itc73.git"

set :use_sudo, false
set :ssh_options, :forward_agent => true
set :rake, "#{rake} --trace"

default_run_options[:pty] = true

namespace :deploy do
  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  desc "Seed database data"
  task :seed_data do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} #{rake} db:seed"
  end
end

namespace :sphinx do
  desc "Symlink Sphinx indexes"
  task :symlink_indexes, :roles => [:app] do
    run "ln -nfs #{shared_path}/db/sphinx #{release_path}/db/sphinx"
  end
end

before 'deploy:finalize_update', 'deploy:symlink_db'
#before 'deploy:update_code', 'thinking_sphinx:stop'
after "deploy:restart", "thinking_sphinx:index", :roles => [:app]
after 'deploy:finalize_update', 'sphinx:symlink_indexes'
after 'deploy:update_code', 'thinking_sphinx:start'
after 'deploy:restart', 'unicorn:stop'
after 'deploy:update', 'deploy:cleanup'
require './config/boot'
