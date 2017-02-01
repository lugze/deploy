lock "3.7.2"

set :application, "lugze_blog"
set :repo_url, "git@github.com:lugze/blog.git"

set :deploy_to, "/var/www/lugze.org/web"

set :format, :airbrussh

set :default_env, { 
    path: "/home/lugze/.rvm/gems/ruby-2.4.0/bin:/home/lugze/.rvm/gems/ruby-2.4.0@global/bin:/home/lugze/.rvm/rubies/ruby-2.4.0/bin:/home/lugze/.rvm/bin:$PATH",
    'GEM_HOME' => '/home/lugze/.rvm/gems/ruby-2.4.0',
    'GEM_PATH' => '/home/lugze/.rvm/gems/ruby-2.4.0:/home/lugze/.rvm/gems/ruby-2.4.0@global'
  }

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
