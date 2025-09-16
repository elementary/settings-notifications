# Notifications Settings
[![Translation status](https://l10n.elementaryos.org/widget/settings/notifications/svg-badge.svg)](https://l10n.elementaryos.org/engage/settings/)

![screenshot](data/screenshot.png?raw=true)

## Building and Installation

You'll need the following dependencies:

* libgranite-7-dev
* libswitchboard-3-dev
* meson
* valac

Run `meson` to configure the build environment and then `ninja` to build

    meson build --prefix=/usr
    cd build
    ninja

To install, use `ninja install`

    ninja install
