# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'mentorminds'
set :repo_url, 'git@github.com:mundhaduguit/mentorminds.git'
set :port, 22
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :user, "www-data"
set :deploy_to, "/srv/Mentorminds"
set :domain, "45.55.91.60"

# Default value for :scm is :git
set :scm, :git
set :branch, "master"
#set :user, "root"
# Default value for :format is :pretty
# set :format, :pretty
set :rails_env, "production"
set :deploy_via, :remote_cache
#set :ssh_options, { :forward_agent => true, :port => 4321 }

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
task :config_symlink do
  run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
end
