set :stage, :dev
set :branch, "dev"
server 'lugze_server', user: 'lugze_dev', roles: %w{web app}, port: 22115

