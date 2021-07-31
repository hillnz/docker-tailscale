#!/usr/bin/env sh

set -ef

# shellcheck disable=SC2086
tailscaled $DAEMON_ARGS & 

if [ "$AUTH_KEY" != "" ]; then
    # shellcheck disable=SC2086
    tailscale up --auth-key "$AUTH_KEY" $UP_ARGS
elif [ "$UP_ARGS" != "" ]; then
    # shellcheck disable=SC2086
    tailscale up $UP_ARGS
fi

fg
