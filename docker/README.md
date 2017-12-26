# Docker

The folder contains a Dockerfile to get started with fm-ProductNode release 2.2.

The Dockerfile might also be helpful as a reference if there are questions or problems arising during the manual installation of fm-ProductNode.

## Content of the container

- debian:jessie operating system
- PHP 7.0 CLI with appropriate php.ini configuration settings
- ioncube Loader for Linux x86-64
- fm-ProductNode application located in the directory */var/fm-productnode*

Note: The container has been created with an older [Docker](https://www.docker.com/) version (1.12)...

## Usage

Download the official PHP image:
```
docker pull php:7.0.24-cli
```

Create a Docker container:
```
docker build -t fmpn/fmpn:2.2.0 <path_to_docker>
```

where *path_to_docker* is the path to the directory containing the Dockerfile.

Execute a shell command in the Docker container:
```
docker run -it --rm --name fmpn \
  -v <path_to_bmecat_documents>:/var/fm-productnode/workplace/bmecat \
  -v <path_to_credits_file>:/var/fm-productnode/credits \
  fmpn/fmpn:2.2.0 \
  <shell_command>
```

Example:
```
docker run -it --rm --name fmpn \
  -v <path_to_bmecat_documents>:/var/fm-productnode/workplace/bmecat \
  -v <path_to_credits_file>:/var/fm-productnode/credits \
  fmpn/fmpn:2.2.0 \
  php trans catalog.read workplace/bmecat/MyBMEcatDocument.xml
```

Die example maps BMEcat files and credit files from the local machine to the Docker container. Then a BMEcat product catalog is read and validated in the Docker container.
