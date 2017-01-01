# Sensus

[![Build Status](https://travis-ci.org/pads/sensus.svg?branch=master)](https://travis-ci.org/pads/sensus)

## Pre-requisites

* [Docker](https://www.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/)
* [Google Cloud SDK](https://cloud.google.com/sdk/)

## Setup

Run the following command:

    bin/setup

This will create and run the required docker containers in the background.
To stop them, run `bin/stop`

# Testing

    docker-compose run test

# Docker Images

Make sure you are logged in first:

    docker login -e <email> -u oauth2accesstoken -p "$(gcloud auth print-access-token)" https://eu.gcr.io

Then run:

    bin/push

# Deployment

Production deployment runs on Google Container Engine.

## First Time Setup

Create a Google Cloud project via [the console](http://console.cloud.google.com/)
and replace all references of `sensus-154219` with the project ID created from this.

Install the [Google Cloud SDK](https://cloud.google.com/sdk/)

Install The Kubenetes CLI: 

    gcloud components install kubectl

Setup a cluster:

    gcloud config set compute/zone europe-west1-c
    gcloud container clusters create sensus-cluster

Obtain the cluster credentials:

    gcloud container clusters get-credentials sensus-cluster

Add the following environment variables as [secrets](http://kubernetes.io/docs/user-guide/secrets/):

WEB_SESSIONS_SECRET:

    kubectl create secret generic session --from-literal=secret=$(bundle exec hanami generate secret web | tail -1 | cut -d'=' -f2- | sed -e 's/^"//' -e 's/"$//')

DATABASE_URL:

    kubectl create secret generic database --from-literal=url=postgres://<username>:<password>@<db_host>/sensus_production

Then create the deployment and load balancer service:

    kubectl create -f deployment.yaml
    kubectl create -f service.yaml
