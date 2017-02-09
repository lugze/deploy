set :stage, :dev
set :branch, "dev"
set :deploy_to, "/var/www/lugze.org/#{fetch(:branch)}"
set :repo_url, "git@github.com:lugze/blog.git"

server 'lugze_server', user: 'lugze', roles: %w{web app}, port: 22115

