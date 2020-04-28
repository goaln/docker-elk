#!/bin/sh
echo "wait for $1 ..."

while ! nc -z $1 $2 ; do
  sleep 1
done

echo "wait done."

java -jar /app.jar
