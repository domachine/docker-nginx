#!/bin/bash

set -e

if [ -f /configured ]; then
  exec /usr/bin/supervisord
fi

password=$(pwgen -1 -s)
echo -e "$password\n$password"|passwd &>/dev/null
echo "PASSWORD: $password"
date > /configured
exec /usr/bin/supervisord
