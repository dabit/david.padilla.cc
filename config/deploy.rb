# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'david.padilla.cc'
set :repo_url, 'git@github.com:dabit/david.padilla.cc.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deploy/www/david.padilla.cc'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/application.yml')


set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
set :assets_roles, [:app]
set :conditionally_migrate, true           # Defaults to false. If true, it's skip migration if files in db/migrate not modified

set :rvm_ruby_version, '2.2.1'

set :passenger_restart_options, -> { "#{deploy_to}" }
set :passenger_restart_with_sudo, true

after :restart do
  within release_path do
    execute :rake, 'fastly:flush'
  end
end
