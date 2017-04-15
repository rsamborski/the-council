# Jedi Council

![Jedi Council](https://vignette2.wikia.nocookie.net/starwars/images/4/44/Councilrots.jpg/revision/latest?cb=20090915231817)

Main Scrum Wars application written in Ruby.

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
docker-compose run the-council rake db:reset
docker-compose run the-council rake db:migrate
docker-compose up
```

This time the application should start correcty and you are ready to go.

# Thanks

* [Dockerizing Ruby on Rails](https://semaphoreci.com/community/tutorials/dockerizing-a-ruby-on-rails-application)