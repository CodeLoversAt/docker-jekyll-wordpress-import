#!/bin/bash

# check variables
if [ -z "$DB_DATABASE" ]; then echo "DB_DATABASE is unset" && exit 1; fi

if [ -z "$DB_USERNAME" ]; then echo "DB_USERNAME is unset" && exit 1; fi

if [ -z "$DB_PASSWORD" ]; then echo "DB_PASSWORD is unset" && exit 1; fi

if [ -z "$DB_HOST" ]; then echo "DB_HOST is unset" && exit 1; fi

if [ -z "$TABLE_PREFIX" ]; then TABLE_PREFIX='wp_'; fi


ruby -rubygems -e "require \"jekyll-import\"; \
    JekyllImport::Importers::WordPress.run({ \
      \"dbname\"   => \"$DB_DATABASE\", \
      \"user\"     => \"$DB_USERNAME\", \
      \"password\" => \"$DB_PASSWORD\", \
      \"host\"     => \"$DB_HOST\", \
      \"socket\"   => \"\", \
      \"table_prefix\"   => \"$TABLE_PREFIX\", \
      \"clean_entities\" => true, \
      \"comments\"       => true, \
      \"categories\"     => true, \
      \"tags\"           => true, \
      \"more_excerpt\"   => true, \
      \"more_anchor\"    => true, \
      \"status\"         => [\"publish\"] \
    })"
