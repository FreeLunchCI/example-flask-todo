# Example Flask Todo App

This is an example todo app. The app was built as an example/reference application, primarily for use with freelunchci.

This app is dockerized and will be kubernetized and freelunchized ;-)

## TODO
* get db init piece to be normal (not need the -s build...-d run...)
* merge over the needed things from README.md into this readme
* commit and push things



## Stack
* web:   alpine:edge (flask, backbone)
* db:    rethinkdb:2.3


## Notices
* this app is not intended to be a production ready app or the base for a production app, its purpose is for example/demonstration usage only.
* the `develop` branch has a freelunch.yml file created for you.
* please see the docs directory for more documentation / information.


## Prerequisites
* docker
* docker-compose


## Setup
* `docker-compose build`


## Run
* initialize database
  - uncomment the `#command: /entrypoint.sh -s` line and comment the `command: /entrypoint.sh -d` line in the docker-compose.yml file
  - build: `docker-compose build`
  - now revert changes by commenting `#command: /entrypoint.sh -s` and and uncommenting the `command: /entrypoint.sh -d` line in the docker-compose.yml file
* start up app: `docker-compose up`
* TODO: make the above smoother....I would like this to be normal, init db if needed, otherwise just run.


## View
* go to: `http://localhost:3000`


## Stop App
* `Ctrl+C` if app is launched interactively or use `docker-componse kill` if launched as daemon (`-d`)


## FLCI Testing
* if you would like to change something in the app to cause a flci build you can update the app's version (config/environment.rb > APP_VERSION).


## Tests
* `docker-compose run -e "RAILS_ENV=test" web rails test test/models/todo_test.rb`


## Attribution
* this app came, in large part, from [rethinkdb's example fask-backbone-todo](https://github.com/rethinkdb/rethinkdb-example-flask-backbone-todo). Please see the README.md.original for the original README.md file along with the license.


## Developer
* any changes to the Gemfile or the Dockerfile necessitate a `docker-compose build`
* get a rails console: `docker-compose run web rails console`
