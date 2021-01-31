### Dockerized Python Backend Application

I created a `Dockerfile` and a `docker-compose.yml` with an empty `Poetry` config ready to be used and install the prefered frameworks / plugins.

It is configured to work with a PostgreSQL database.

#### Installation

1. clone this repo

2. build containers with

        docker-compose build

It will create the `db` and `app` images along with a `postgres_data` volume

#### Installing new Poetry dependencies

run 

##### References

- [https://medium.com/@samwelkanda/how-to-initialize-a-django-project-with-poetry-and-docker-ef4997006f2f](https://medium.com/@samwelkanda/how-to-initialize-a-django-project-with-poetry-and-docker-ef4997006f2f)
- [https://davebaker.me/2020/07/19/setting-up-django-project-with-poetry/](https://davebaker.me/2020/07/19/setting-up-django-project-with-poetry/)
