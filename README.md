# Sensus

[![Build Status](https://travis-ci.org/pads/sensus.svg?branch=master)](https://travis-ci.org/pads/sensus)

## Pre-requisites

* [Docker](https://www.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/)

## Setup

Run the following command:

    bin/setup

This will create and run the required docker containers in the background.
To stop them, run `bin/stop`

# Testing

    docker-compose run test
