set :stage, :development
set :branch, "development"
set :deploy_to, "/var/www/lugze.org/#{fetch(:branch)}"
set :repo_url, "git@github.com:lugze/new_site.git"

server 'lugze_server', user: 'lugze', roles: %w{web app}, port: 22115

