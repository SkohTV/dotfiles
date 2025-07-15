# Scripts

## Shebang
**Q:** Why using `#!/usr/bin/env bash` instead of `#!/bin/bash` ?<br>
**A:** Because if bash isn't installed in `/bin`, but in another place (like `/nix/store`), then it wouldn't work. This solution should work for both Nix systems and non Nix systems
