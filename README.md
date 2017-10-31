# AWS_Dockerfile

* Build image
    docker build -t <image_name> -f AWS_Dockerfile .

* Run container
    docker run -v /home/tobias/.ssh:/root/.ssh -e "AWS_ACCESS_KEY_ID=<aws_access_key>" -e "AWS_SECRET_ACCESS_KEY=<>ws_secret_key" -it <image_name> /bin/bash
