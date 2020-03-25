#!/bin/bash
#
# Run tests. Meant to be run on a CI server with Docker installed.
#
set -e
./cem.sh
./cem.sh usage
./cem.sh self-test
