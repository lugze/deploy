set :stage, :production
set :branch, "master"
server 'lugze_server', user: 'lugze', roles: %w{web app}, port: 22115

