#!/usr/bin/env bash

git clone https://github.com/BlackrockDigital/startbootstrap-coming-soon /tmp/bootstrap4
mv /tmp/bootstrap4/* /usr/share/nginx/html/templates/bootstrap4

rm -R /tmp/bootstrap4
rm /usr/share/nginx/html/templates/bootstrap4/checkout.sh #self cleanup