# Example Flask Todo App

This is an example todo app. The app was built as an example/reference application, primarily for use with freelunchci.

This app is dockerized and will be kubernetized and freelunchized ;-)


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
* start up app: `docker-compose up`
* run via docker: `docker run -i -t -v /absolute/path/to/source:/app --rm example-flask-todo`


## View
* go to: `http://localhost:3000`


## Stop App
* `Ctrl+C` if app is launched interactively or use `docker-componse kill` if launched as daemon (`-d`)


## Test
* unit testing is integrated into the app via the dockerfile, a normal docker run (`docker run -i -t --rm example-flask-todo`) and `docker-compose up` both execute all unit tests
* for FLCI testing, increment the app's version and push to invoke a new build
  - application version: `APPVER in /todo.py`


## Attribution
This app came, in large part, from [rethinkdb's example fask-backbone-todo](https://github.com/rethinkdb/rethinkdb-example-flask-backbone-todo). Please see the README.md.original for the original README.md file along with the license.


## Developer
* any changes to the Gemfile or the Dockerfile necessitate a `docker-compose build`
* get a rails console: `docker-compose run web rails console`
