# https://docs.docker.com/engine/reference/builder/#understand-how-arg-and-from-interact
ARG REDIS_VERSION=7.0.5

# The different stages of this Dockerfile are meant to be built into separate images
# https://docs.docker.com/develop/develop-images/multistage-build/#stop-at-a-specific-build-stage
# https://docs.docker.com/compose/compose-file/#target
FROM redis:${REDIS_VERSION}-alpine

COPY docker/cache/redis/conf/redis.conf /usr/local/etc/redis/redis.conf

CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]
