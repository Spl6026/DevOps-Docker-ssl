#!/bin/bash

subsite="$1"

port="$2"

sed -i "/RewriteCond %{REQUEST_URI} ^\/${subsite}/d" /etc/apache2/sites-enabled/project.conf

sed -i "/RewriteRule ^(.*)$ \/${subsite}\/ \[R=301,L\]/d" /etc/apache2/sites-enabled/project.conf

sed -i "/ProxyPass \/${subsite}\//d" /etc/apache2/sites-enabled/project.conf

sed -i "/ProxyPassReverse \/${subsite}\//d" /etc/apache2/sites-enabled/project.conf

docker stop "${subsite}_${port}"

docker remove "${subsite}_${port}"

service apache2 reload
