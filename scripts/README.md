# Scripts

## Shebang
**Q:** Why using `#!/usr/bin/env bash` instead of `#!/bin/bash` ?<br>
**A:** Because if bash isn't installed in `/bin`, but in another place (like `/nix/store`), then it wouldn't work. This solution should work for both Nix systems and non Nix systems

## Shell
[`battery_warning.sh`](./battery_warning.sh) -> Send dunstify notifs when low / high battery<br>
[`fetch.sh`](./fetch.sh) -> Output raw data about system to stdout<br>
[`randomize-desktop.sh`](./randomize-desktop.sh) -> Pick a desktop using a random seed base on today's date<br>
[`screenshare.sh`](./screenshare.sh) -> Enable my hdmi port from nvidia card (fuck nvidia)<br>
[`startup.sh`](./startup.sh) -> Start the app to start on startup of my wm<br>
[`zellij-init.sh`](./zellij-init.sh) -> Connect to / launch a custom layout zellij session<br>