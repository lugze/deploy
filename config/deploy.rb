lock "3.7.2"

set :application, "lugze_blog"
set :repo_url, "git@github.com:lugze/blog.git"

set :deploy_to, "/var/www/lugze.org/web"

set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

set :default_env, { 
    path: "/home/lugze/.rvm/gems/ruby-2.4.0/bin:/home/lugze/.rvm/gems/ruby-2.4.0@global/bin:/home/lugze/.rvm/rubies/ruby-2.4.0/bin:/home/lugze/.rvm/bin:$PATH",
    'GEM_HOME' => '/home/lugze/.rvm/gems/ruby-2.4.0',
    'GEM_PATH' => '/home/lugze/.rvm/gems/ruby-2.4.0:/home/lugze/.rvm/gems/ruby-2.4.0@global'
  }

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :jekyll do
    task :build do
        on roles(:app), in: :sequence, wait: 1 do
            within release_path  do
                execute :bundle, "exec jekyll build --source /var/www/lugze.org/web/current --destination /var/www/lugze.org/web/current/_site"
            end
            end
    end
end

after "deploy:finished", "jekyll:build"

