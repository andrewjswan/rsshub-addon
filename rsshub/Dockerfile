ARG BUILD_FROM
FROM diygod/rsshub AS org

FROM $BUILD_FROM

# Packages
RUN \
  apk add --no-cache --virtual .build-dependencies \
    npm

WORKDIR /app

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

# Add Label
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Andrew J.Swan <andrewjswan@addons.community>"

# Copy data for add-on
COPY --from=org /app /app

COPY run.sh /
RUN chmod a+x /run.sh

# Start RSSHub

CMD [ "/run.sh" ]
