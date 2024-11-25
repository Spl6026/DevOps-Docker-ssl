#!/bin/bash

ip="$1"

subsite="$2"

port="$3"

sed -i "/<\/VirtualHost>/i \
        RewriteCond %{REQUEST_URI} ^/${subsite}$ \n\
        RewriteRule ^(.*)$ /${subsite}/ [R=301,L]" /etc/apache2/sites-enabled/project.conf

sed -i "\$aProxyPass /${subsite}/ http://${ip}:${port}/" /etc/apache2/sites-enabled/project.conf

sed -i "\$aProxyPassReverse /${subsite}/ http://${ip}:${port}/" /etc/apache2/sites-enabled/project.conf

service apache2 reload