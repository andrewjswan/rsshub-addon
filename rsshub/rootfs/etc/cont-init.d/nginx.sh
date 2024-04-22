#!/usr/bin/with-contenv bashio
# ==============================================================================
# Configure NGINX for use with RSSHub
# ==============================================================================
ingress_entry=$(bashio::addon.ingress_entry)

[[ $ingress_entry =~ ^/(.*)$ ]] && ingress_entry=${BASH_REMATCH[1]} # Remove slashes from both sides

sed -i "s|%%ingress_entry%%|${ingress_entry}|g" /etc/nginx/nginx.conf
