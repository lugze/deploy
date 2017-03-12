lock "3.8.0"

set :application, "lugze_blog"

set :deploy_to, "/var/www/lugze.org/#{fetch(:branch)}"

set :format, :airbrussh

set :default_env, { 
    path: "/home/lugze/.rvm/gems/ruby-2.4.0/bin:/home/lugze/.rvm/gems/ruby-2.4.0@global/bin:/home/lugze/.rvm/rubies/ruby-2.4.0/bin:/home/lugze/.rvm/bin:$PATH",
    'GEM_HOME' => '/home/lugze/.rvm/gems/ruby-2.4.0',
    'GEM_PATH' => '/home/lugze/.rvm/gems/ruby-2.4.0:/home/lugze/.rvm/gems/ruby-2.4.0@global'
  }

set :keep_releases, 5

namespace :jekyll do
    desc "Build pages from markdown to html with jekyll"
    task :build do
        on roles(:app), in: :sequence, wait: 1 do
            within release_path  do
                execute :bundle, "exec jekyll build"
            end
        end
    end
end

namespace :bundler do

    desc "Install gems with bundle"
    task :install do
        on roles(:app), in: :sequence, wait: 1 do
            within release_path  do
                execute :bundle, "install"
            end
        end
    end

    desc "Update gems with bundle"
    task :update do
        on roles(:app), in: :sequence, wait: 1 do
            within release_path  do
                execute :bundle, "update"
            end
        end
    end

end

after "deploy:finished", "bundler:install"
after "deploy:finished", "bundler:update"
after "deploy:finished", "jekyll:build"

