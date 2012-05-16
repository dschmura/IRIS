require 'bundler/capistrano'
$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'rvm/capistrano'

# =============================================================================
# GENERAL SETTINGS
# =============================================================================

role :web, "dewey.lsa.umich.edu"
role :app, "dewey.lsa.umich.edu"
role :db,  "dewey.lsa.umich.edu", :primary => true

set :application,  "iris"
set :deploy_to,  "/var/www/html/#{application}"
set :deploy_via, :remote_cache
set :scm, :git
set :repository, "git@bugs.iss.lsa.umich.edu:iris.git"
set :git_enable_submodules, 1
set :scm_verbose, true
set :use_sudo, false
set :user, "iris"

set :rvm_ruby_string, 'ruby-1.9.3'


set :ssh_options, { :forward_agent => true }
default_run_options[:pty] = true

# =============================================================================
# RECIPE INCLUDES
# =============================================================================



# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
   
   #This step seems to fail often.  I think it is failing on getting to the current path.
#   namespace :seed do
#     run "cd #{current_path}; rake db:migrate RAILS_ENV=production"
#   end
   
   # Link in database config
   after "deploy:update_code", :link_production_db_config
  
end

task :link_production_db_config do
  run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
end

