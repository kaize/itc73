set :rvm_type, :user
set :stages, %w(staging)
set :default_stage, "staging"
set :rvm_ruby_string, '1.9.3'
set :whenever_command, "bundle exec whenever" # update crontab

set :use_sudo, false

set :ssh_options, :forward_agent => true
default_run_options[:pty] = true

set :application, "itc73"

set :scm, :git
set :repository,  "git@github.com:kaize/itc73.git"

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
before 'deploy:update_code', 'thinking_sphinx:stop'
after "deploy:restart", "thinking_sphinx:index", :roles => [:app]
after 'deploy:finalize_update', 'sphinx:symlink_indexes'
after 'deploy:update_code', 'thinking_sphinx:start'
after 'deploy:restart', 'unicorn:stop'
after 'deploy:update', 'deploy:cleanup'
        require './config/boot'
        require 'airbrake/capistrano'
