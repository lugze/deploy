set :stage, :dev
set :branch, "dev"
server 'lugze_server', user: 'lugze', roles: %w{web app}, port: 22115

