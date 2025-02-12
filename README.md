<div align="center">
<h1>RSSHub Add-on</h1>
</div>

## General

[![ha addon_badge](https://img.shields.io/badge/HA-Addon-blue.svg)](https://developers.home-assistant.io/docs/add-ons)
[![rsshub](https://img.shields.io/badge/RSS-Hub-blue.svg)](https://github.com/andrewjswan/rsshub-addon/)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/andrewjswan/rsshub-addon/build.yml?logo=github)](https://github.com/andrewjswan/rsshub-addon/actions)
[![GitHub](https://img.shields.io/github/license/andrewjswan/rsshub-addon?color=blue)](https://github.com/andrewjswan/rsshub-addon/blob/master/LICENSE)
[![GitHub release (latest SemVer including pre-releases)](https://img.shields.io/github/v/release/andrewjswan/rsshub-addon?include_prereleases)](https://github.com/andrewjswan/rsshub-addon/blob/main/rsshub/CHANGELOG.md)
[![GitHub package.json version](https://img.shields.io/github/package-json/v/DIYgod/RSSHub?label=RSSHub%40based)](https://github.com/DIYgod/RSSHub)
[![StandWithUkraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://github.com/vshymanskyy/StandWithUkraine/blob/main/docs/README.md)

RSSHub is an open source, easy to use, and extensible RSS feed generator. It's capable of generating RSS feeds from pretty much everything.

## Architecture

![Supports amd64 Architecture][amd64-shield] ![Supports aarch64 Architecture][aarch64-shield] ![Supports armv7 Architecture][armv7-shield] ![Supports armhf Architecture][armhf-shield] ![Supports i386 Architecture][i386-shield]

## Installation

Add the repository URL under **Supervisor → Add-on Store** in your Home Assistant front-end:

    https://github.com/andrewjswan/rsshub-addon/

## Confururation settings

Configure the add-on via your Home Assistant front-end under **Supervisor → Dashboard → RSSHub**.

If you need to add route specific configurations, create a `routes_env.sh` file in the `/addons_config/rsshub` directory with the necessary environment variables, for example:
```
export IG_USERNAME=user
export IG_PASSWORD=password
```

## Notes

Builded from https://github.com/DIYgod/RSSHub

[amd64-shield]: https://img.shields.io/badge/amd64-yes-blue.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-blue.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-blue.svg
[armhf-shield]: https://img.shields.io/badge/armhf-no-red.svg
[i386-shield]: https://img.shields.io/badge/i386-no-red.svg
