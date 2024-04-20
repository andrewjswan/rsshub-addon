ARG BUILD_FROM
FROM $BUILD_FROM

### Build RSSHub

# Packages
RUN \
  apk add --no-cache --virtual .build-dependencies \
    git npm

# Clone
ADD "https://api.github.com/repos/DIYgod/RSSHub/commits?per_page=1" latest_commit
RUN \
  git clone --branch master --single-branch https://github.com/DIYgod/RSSHub.git \
  && cd ./RSSHub

WORKDIR /RSSHub

# Build
RUN npm install
RUN npm run build

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
COPY run.sh /
RUN chmod a+x /run.sh

# Start RSSHub

CMD [ "/run.sh" ]
