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

cd /app

bashio::log.info 'RSSHub Starting...'
bashio::log.info 'Configuration:'

export NO_LOGFILES=true
export DISALLOW_ROBOT=false
export TITLE_LENGTH_LIMIT=255

if bashio::config.has_value 'request_retry'; then
  export REQUEST_RETRY=$(bashio::config 'request_retry')
  bashio::log.blue "  Request retry: $(bashio::config 'request_retry')"
fi
if bashio::config.has_value 'request_timeout'; then
  export REQUEST_TIMEOUT=$(bashio::config 'request_timeout')
  bashio::log.blue "  Request timeout: $(bashio::config 'request_timeout')"
fi
if bashio::config.has_value 'cache_expire'; then
  export CACHE_EXPIRE=$(bashio::config 'cache_expire')
  bashio::log.blue "  Cache expire: $(bashio::config 'cache_expire')"
fi
if bashio::config.has_value 'cache_content_expire'; then
  export CACHE_CONTENT_EXPIRE=$(bashio::config 'cache_content_expire')
  bashio::log.blue "  Cache content expire: $(bashio::config 'cache_content_expire')"
fi
if bashio::config.has_value 'logger_level'; then
  export LOGGER_LEVEL=$(bashio::config 'logger_level')
  bashio::log.blue "  Logger level: $(bashio::config 'logger_level')"
fi

ROUTE_FILE="/addons_config/rsshub/routes_env.sh"
if [ -f $ROUTE_FILE ]; then
  bashio::log.notice '  Adding route specific configurations:'
  bashio::log.notice "  ${ROUTE_FILE}"
  source $ROUTE_FILE
fi

bashio::log.blue "RSSHub port mapping (local:external): $(bashio::addon.network), use external port for access."

bashio::log.info 'RSSHub Start'

# ==============================================================================

bashio::color.blue
npm run start
bashio::color.reset

# ==============================================================================

bashio::log.info 'RSSHub Stop'
bashio::exit.ok
