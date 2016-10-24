# django-stack
Docker Compose with service discovery for a Django project

**5 components**

1. db -> MySQL DB server
2. consul -> Service discovery
3. registrator -> Service registry bridge for Docker
4. nginx -> Load balancer
5. web -> basic django project with django-restframework and mysql client

**.env file needed with this variables:**

- HOSTIP=X.X.X.X
- MYSQL_ROOT_PASSWORD=DB_PASSWORD
- MYSQL_DATABASE=DB_NAME
- SECRET_KEY=DJANGO_SECRET_KEY
- DEBUG=[0-1]
- IN_DEV=[0-1]

# Basic guide

1. Clone respository
2. Create your own .env file
3. docker-compose up -d
4. docker-compose scale web=2  (Now you have 2 web services)
5. docker-compose stop   (Stop containers)
6. docker-compose down   (Stop and Remove containers)
