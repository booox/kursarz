lock '3.2.1'

set :application, 'kursarz'

set :scm, :git

set :repo_url, 'git@gitlab.com:michaldarda/kursarz.git'

set :tmp_dir, "/home/kursarz/tmp"

set :log_level, :info

set :deploy_to, '/home/kursarz/apps/kursarz'

set :branch, :production

set :stage, :production

set :keep_releases, 5

set :rvm_ruby_version, '2.1.2@kursarz'

set :unicorn_config_path, 'config/unicorn.rb'

set :unicorn_rack_env, :production

set :rails_env, "production"

set :linked_files, %w{config/secrets.yml config/database.yml config/unicorn.rb}

set :linked_dirs, %w{bin log tmp/pids vendor/bundle public/system}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after 'deploy:publishing', 'deploy:restart'
  namespace :deploy do
    task :restart do
      invoke 'unicorn:restart'
    end
  end

  after :finishing, "deploy:cleanup"
end
