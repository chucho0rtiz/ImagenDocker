#!/bin/bash
set -e

POSTGRES="psql --username ${POSTGRES_USER} -v ON_ERROR_STOP=1"

$POSTGRES --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE orders;
EOSQL

$POSTGRES --dbname "orders" <<-EOSQL
    CREATE TABLE USERS(
        ID SERIAL PRIMARY KEY,
        USERNAME VARCHAR NOT NULL,
        PASSWORD VARCHAR NOT NULL
    );

    CREATE TABLE PRODUCTS(
        productId SERIAL PRIMARY KEY,
        name VARCHAR NOT NULL,
        description VARCHAR NOT NULL,
        basePrice DECIMAL NOT NULL,
        taxRate VARCHAR NOT NULL,
        productStatus VARCHAR NOT NULL,
        inventoryQuantity INTEGER NOT NULL
    );
EOSQL