### Dockerized Python Backend Application

I created a `Dockerfile` and a `docker-compose.yml` with an empty `Poetry` config ready to be used and install the prefered frameworks / plugins.

It is configured to work with a PostgreSQL database.

#### Installation

1. clone this repo

2. create a `.env` file based on `.env.default` (you can remove `.env.default`) from now on.

2. build containers with

        docker-compose build

It will create the `db` and `backend` images along with a `postgres_data` volume

A Django empty app is provided being created with the command (this was done outside the container):

	django-admin startproject app backend

To create a new app in django (i.e. "core" app):

	docker-compose exec backend sh -c "cd backend && python manage.py startapp core"

**NOTE:** _if you want to use other framework different that Django, just remove `backend` dir and `manage.py` file and create your own app with the framework of your choice (outside the container)_

#### Installing new Poetry dependencies

TODO: add more

##### References

- [https://medium.com/@samwelkanda/how-to-initialize-a-django-project-with-poetry-and-docker-ef4997006f2f](https://medium.com/@samwelkanda/how-to-initialize-a-django-project-with-poetry-and-docker-ef4997006f2f)
- [https://davebaker.me/2020/07/19/setting-up-django-project-with-poetry/](https://davebaker.me/2020/07/19/setting-up-django-project-with-poetry/)
- [https://stackoverflow.com/questions/53835198/integrating-python-poetry-with-docker](https://stackoverflow.com/questions/53835198/integrating-python-poetry-with-docker)
