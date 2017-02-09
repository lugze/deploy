set :stage, :development
set :branch, "development"
set :deploy_to, "/var/www/lugze.org/#{fetch(:branch)}"

server 'lugze_server', user: 'lugze_dev', roles: %w{web app}, port: 22115

