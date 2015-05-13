require "bundler/capistrano"
#require 'rvm/capistrano'

set :application, "redeinde"

set :deploy_to, "/var/www/redeinde"
set :branch, "master"

# set :repository,  "git@github.com:itsme/#{application}.git"         # não quero usar o github
set :repository, "."
set :local_repository, "."              # eu tirei essa linha fora, mas pode ser que precise

set :scm, :git

# set :deploy_via, :remote_cache                 # esse era o default 
set :deploy_via, :copy                          # a ideia é não usar um host remoto
set :copy_cache, true                         # tentativa de otimizar o deploy
set :copy_exclude, [".git", "private/*", "log/*", ".bundle", "tmp/*", "spec", "test"] 

# server "189.9.150.184", :web, :app, :db, primary: true
server "189.9.150.184", :web, :app, :db, primary: true
set :port, 22

set :user, "inde"
set :use_sudo, true

default_run_options[:pty] = true
ssh_options[:forward_agent] = true # essa linha pode ter de ser apagada para não pedir password

after "deploy", "deploy:cleanup"

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/private && chmod 755 #{shared_path}/private"
    # put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    # puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    # run "ln -nfs #{shared_path}/private #{release_path}/private"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  desc "reload the database with seed data"
  task :seed do    
    run "cd #{current_path} && bundle exec rake db:seed RAILS_ENV=#{rails_env}"
  end  
  # before "deploy", "deploy:check_revision"
  task :cleanup, :except => {:no_release => true} do
    count = fetch(:keep_releases, 5).to_i
    run "ls -1dt #{releases_path}/* | tail -n +#{count + 1} | #{try_sudo} xargs rm -rf"
  end
end

# set :application, "set your application name here"
# set :repository,  "set your repository location here"
# 
# # set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# # Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
# 
# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end


##########################################################################
# original file goes below:

# set :application, "set your application name here"
# set :repository,  "set your repository location here"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# role :web, "your web-server here"                          # Your HTTP server, Apache/etc
# role :app, "your app-server here"                          # This may be the same as your `Web` server
# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end