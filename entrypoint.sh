#!/bin/bash
# FILE: entrypoint.sh

# Activate the pixi environment
pixi shell

# Execute the command passed to the container
exec "$@"