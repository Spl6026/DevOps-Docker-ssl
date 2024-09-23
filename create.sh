#!/bin/bash

subsite="$1"

port="$2"

image="$3"

extra=" $4 "

sed -i "/<\/VirtualHost>/i \
        RewriteCond %{REQUEST_URI} ^/${subsite}$ \n\
        RewriteRule ^(.*)$ /${subsite}/ [R=301,L]" /etc/apache2/sites-enabled/project.conf

sed -i "\$aProxyPass /${subsite}/ http://localhost:${port}/" /etc/apache2/sites-enabled/project.conf

sed -i "\$aProxyPassReverse /${subsite}/ http://localhost:${port}/" /etc/apache2/sites-enabled/project.conf

docker run --name "${subsite}_${port}" -idt -p ${port}:80 ${extra} ${image}

service apache2 reload