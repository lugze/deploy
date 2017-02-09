set :stage, :production
set :branch, "master"
set :repo_url, "git@github.com:lugze/blog.git"

server 'lugze_server', user: 'lugze', roles: %w{web app}, port: 22115

