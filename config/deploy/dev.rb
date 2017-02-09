set :stage, :dev
set :branch, "dev"
set :deploy_to, "/var/www/lugze.org/#{fetch(:branch)}"

server 'lugze_server', user: 'lugze', roles: %w{web app}, port: 22115

