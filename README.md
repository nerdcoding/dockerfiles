## AWS_Dockerfile

* Build image \
`docker build -t <image_name> -f AWS_Dockerfile .`

* Run container \
`docker run -v /home/tobias/.ssh:/root/.ssh -e "AWS_ACCESS_KEY_ID=<aws_access_key>" -e "AWS_SECRET_ACCESS_KEY=<>ws_secret_key" -it <image_name> /bin/bash`

## PostgreSQL

* Use official Dockerfile \
`docker run --name <container_name> -e POSTGRES_USER=<db_user> -e POSTGRES_PASSWORD=<db_password> -e POSTGRES_DB=<db_name> -p 5432:5432 -d postgres`

