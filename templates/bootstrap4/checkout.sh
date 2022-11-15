#!/usr/bin/env bash

git clone https://github.com/BlackrockDigital/startbootstrap-coming-soon /tmp/bootstrap4
cd /tmp/bootstrap4
git reset --hard 0b23abbcf2a4cb53538f6bbe818307e0af27218a

mv /tmp/bootstrap4/* /usr/share/nginx/html/templates/bootstrap4

rm -R /tmp/bootstrap4
rm /usr/share/nginx/html/templates/bootstrap4/checkout.sh #self cleanup