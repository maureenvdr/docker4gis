FROM docker4gis/proxy

# These default values are overwritten by run time environment values, if set:
ENV API="http://${DOCKER_USER}-api:8080/"
ENV APP="http://${DOCKER_USER}-app/"
ENV HOMEDEST="/${DOCKER_USER}/app/"
# Optionally specify your proper default value for this one:
# ENV SECRET="default_value"

# Where to ask for authorisation
ENV AUTH_PATH="http://${DOCKER_USER}-api:8080/rpc/auth_path"

# IF you don't want all the containers availible throught the proxy make your own config to limit to only the ones you want and add that config
# COPY conf/conf.sh  /conf.sh