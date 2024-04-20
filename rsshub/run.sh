#!/usr/bin/with-contenv bashio

# ==============================================================================
# Home Assistant RSSHub Add-on
# Displays a simple add-on banner on startup
# ==============================================================================

if bashio::supervisor.ping; then
  bashio::log.blue \
    '-----------------------------------------------------------'
  bashio::log.blue " Add-on: $(bashio::addon.name)"
  bashio::log.blue " $(bashio::addon.description)"
  bashio::log.blue \
    '-----------------------------------------------------------'
  bashio::log.blue " Add-on version: $(bashio::addon.version)"
  if bashio::var.true "$(bashio::addon.update_available)"; then
    bashio::log.magenta ' There is an update available for this add-on!'
    bashio::log.magenta \
        " Latest add-on version: $(bashio::addon.version_latest)"
    bashio::log.magenta ' Please consider upgrading as soon as possible.'
  else
    bashio::log.green ' You are running the latest version of this add-on.'
  fi

  bashio::log.blue " System: $(bashio::info.operating_system)" \
    " ($(bashio::info.arch) / $(bashio::info.machine))"
  bashio::log.blue " Home Assistant Core: $(bashio::info.homeassistant)"
  bashio::log.blue " Home Assistant Supervisor: $(bashio::info.supervisor)"

  bashio::log.blue \
    '-----------------------------------------------------------'
  bashio::log.blue \
    ' Please, share the above information when looking for help'
  bashio::log.blue \
    ' or support in, e.g., GitHub, forums or the Discord chat.'
  bashio::log.blue \
    '-----------------------------------------------------------'
fi

# ==============================================================================

cd /RSSHub

CONFIG_PATH=/data/options.json

bashio::log.info 'RSSHub Starting...'

bashio::log.info 'Prepare config...'
echo >> .env
echo 'PORT=5000' >> .env
echo 'NO_LOGFILES=true' >> .env
echo 'DISALLOW_ROBOT=false' >> .env
echo 'TITLE_LENGTH_LIMIT=255' >> .env

REQUEST_RETRY="$(bashio::config 'request_retry')"
if [ "$REQUEST_RETRY" != "null" ]; then
  echo "REQUEST_RETRY=${REQUEST_RETRY}" >> .env
fi
REQUEST_TIMEOUT="$(bashio::config 'request_timeout')"
if [ "$REQUEST_TIMEOUT" != "null" ]; then
  echo "REQUEST_TIMEOUT=${REQUEST_TIMEOUT}" >> .env
fi
LOGGER_LEVEL="$(bashio::config 'logger_level')"
if [ "$LOGGER_LEVEL" != "null" ]; then
  echo "LOGGER_LEVEL=${LOGGER_LEVEL}" >> .env
fi

bashio::log.info 'RSSHub Start'
bashio::log.info

# ==============================================================================

bashio::color.blue
npm run start
bashio::color.reset

# ==============================================================================

bashio::log.info
bashio::log.info 'RSSHub Stop'
bashio::exit.ok
