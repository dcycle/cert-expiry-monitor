#!/bin/bash
#
# Run tests. Meant to be run on a CI server with Docker installed.
#
set -e
./example-script.sh
./example-script.sh usage
./example-script.sh help say-hello-world
./example-script.sh say-hello-world
./example-script.sh say-hello-world --type=caps
./example-script.sh say-hello-world --type=caps --simulation-mode=true
./example-script.sh self-test
