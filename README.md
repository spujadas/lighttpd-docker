# lighttpd Docker image

Security, speed, compliance, and flexibility -- all of these describe [lighttpd](http://www.lighttpd.net/)

### Contents

 - Usage
	 - Start a container with Docker
	 - Start a container with Docker Compose
 - Build
	 - Build with Docker
	 - Build with Docker Compose
	 - Build with Docker Buildx
 - About

## Usage

In the instructions that follow, replace:

- `<home-directory>` with the path of the local directory you want to serve content from.

- `<config-directory>` with the path of the local directory containing lighttpd configuration files that you want to use instead of the default ones.

	To make it easier to create custom configuration files, the default configuration files are included in the `etc/lighttpd` directory of the Git repository.
 
-  `<http-port>` with the HTTP port you want the HTTP server to serve content to (e.g. `80` for the standard HTTP port if not already in use on the host).

### Start a container with Docker

With the default configuration files:

	$ sudo docker run --rm -t -v <home-directory>:/var/www/localhost/htdocs -p <http-port>:80 sebp/lighttpd

With custom configuration files:

	$ sudo docker run --rm -t -v <home-directory>:/var/www/localhost/htdocs -v <config-directory>:/etc/lighttpd -p <http-port>:80 sebp/lighttpd

### Start a container with Docker Compose

Add the following lines in an existing or a new `docker-compose.yml` file:

	lighttpd:
	  image: sebp/lighttpd
	  volumes:
	    - <home-directory>:/var/www/localhost/htdocs
	    - <config-directory>:/etc/lighttpd
	  ports:
	    - "<http-port>:80"
	  tty: true

**Note** – The `- <config-directory>:…` line is optional, it can be used to override the default configuration files with your own.

Then start a lighttpd container with:

	$ sudo docker-compose up lighttpd


## Build

First clone or download the [spujadas/lighttpd-docker](https://github.com/spujadas/lighttpd-docker) GitHub repository, open a shell in the newly created `lighttpd-docker` directory, then build the image and run a container using Docker, Docker Compose, or Docker Buildx, as explained below.

### Build with Docker

This command will build the image:

	$ sudo docker build .

### Build with Docker Compose

Build the image with this command:

	$ sudo docker-compose build

### Build with Docker Buildx

Build the image with this command:

	$ sudo buildx build .

## About

Written by [Sébastien Pujadas](http://pujadas.net), released under the [MIT license](http://opensource.org/licenses/MIT).
