# deploy
Capistrano deploy procedura za lugze web site.

## Setup

1 .Potrebno je dodati na lokalni racunar u `/etc/hosts` file zapis za lugze_server.
2. Install Capistrano: gem install capistrano
3. git clone git@github.com:lugze/deploy.git
4. Deploy: `cap production deploy`

## Testing

`ssh lugze@lugze_server -p 22115`

## Required gems

`gem install bundle jekyll jekyll-feed minima`

## Pokretanje

`cap production deploy`
