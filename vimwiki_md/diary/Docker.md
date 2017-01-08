# Docker
    - Start docker daemon `sudo service docker start`
    - Test hello-world `sudo docker run hello-world`
    - Create Dockerfile ([example](https://docs.docker.com/engine/getstarted/step_four/) // I got mine from `git clone https://github.com/amanbh/docker-python` )
    - Edit *Dockerfile*
    - Build docker image locally `docker build -t tagname .`  
    - Verify it is build `sudo docker images`
    - Run the new image `sudo docker run tagname`
