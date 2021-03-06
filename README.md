## !!! WARNING: THIS REPO IS NO LONGER MAINTAINED AND HAS BEEN ARCHIVED !!!

# The Council / Jedi Council

Main Scrum Wars application written in Ruby on Rails.

![Jedi Council](https://vignette2.wikia.nocookie.net/starwars/images/4/44/Councilrots.jpg/revision/latest?cb=20090915231817)

# Requirements

* docker (apt-get install docker)
* docker-compose (https://github.com/docker/compose/releases)

# Installation

Preparation for first run:
```bash
git clone https://github.com/scrum-wars/the-council.git 
cd the-council.git
cp .the-council.env.sample .the-council.env
cp docker-compose.yml.sample docker-compose.yml
vim .the-council.env  # update secret token and postgresql password
vim docker-compose.yml # update postgresql password - must match the one set above
docker volume create --name the-council-postgres
docker volume create --name the-council-redis
docker-compose up
```

In the first run the-council application will fail with errors due to lack of database. 
Use CTRL+C to stop docker compose, afterwards run:
```bash
docker-compose run the-council rails db:reset
docker-compose up
```

This time the application should start correcty and you are ready to go.

Application will be available under: `http://localhost:8000`

# Shout-outs

* [Dockerizing Ruby on Rails](https://semaphoreci.com/community/tutorials/dockerizing-a-ruby-on-rails-application)
* [Make bundler fast again in Docker](http://bradgessler.com/articles/docker-bundler/)
