#!/usr/bin/env bash

# Setup TWIG
wget https://github.com/okdana/twigc/releases/download/v0.2.0/twigc.phar -O /tmp/twig.phar && chmod +x /tmp/twig.phar && mv /tmp/twig.phar /usr/local/bin/twig

cd /usr/share/nginx/html

mv templates/${TEMPLATE}/* ./

mv ./nginx.conf /etc/nginx/conf.d/default.conf

rm -R templates

if [ ! -f config/config.json ]; then
    echo "## write config file from env into config/config.json ##"
    variables=(TEMPLATE TITLE SUBLINE FACEBOOK_URL TWITTER_URL GITHUB_URL BASE_DIR)
    config="{"
    for var in ${variables[@]}; do
        content=$(echo ${!var}|sed "s/\"/'/g") #replace " with ' to keep json valid
        config+="\"$var\":\"$content\","
    done
    config+="\"config\":true}" #this is only to provide valid json
    echo "index parameter: $config"
    echo $config > config/config.json
else
    echo "## existing config/config.json found - not overwriting file ##"
fi

echo '### Compile index.html file ... ###'
twig "index.html.twig" -j config/config.json > index.html
rm -rf config
rm -rf .git

echo "#### Starting Nginx ... ####"
nginx -g "daemon off;"

exit 0;