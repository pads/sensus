#!/usr/bin/env bash

set -e

psql template1 -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    create user root with password '';
    alter user root createdb;
    create database sensus_development owner root;
    create database sensus_test owner root;
    grant all privileges on database sensus_development to root;
    grant all privileges on database sensus_test to root;
EOSQL
