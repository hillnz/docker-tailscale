#!/usr/bin/env sh

set -ef

{
    echo "Waiting for a moment before running 'up'..."
    sleep 5
    if [ "$AUTH_KEY" != "" ]; then
        # shellcheck disable=SC2086
        tailscale up --authkey "$AUTH_KEY" $UP_ARGS
    elif [ "$UP_ARGS" != "" ]; then
        # shellcheck disable=SC2086
        tailscale up $UP_ARGS
    fi
} &

# shellcheck disable=SC2086
exec tailscaled $DAEMON_ARGS
