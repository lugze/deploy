set :stage, :development
set :branch, "development"
server 'lugze_server', user: 'lugze_dev', roles: %w{web app}, port: 22115

