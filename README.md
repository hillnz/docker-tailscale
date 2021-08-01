# docker-tailscale

An unofficial [Tailscale](https://tailscale.com) Docker image.

It's based on the official image, but it also includes an entrypoint script with configuration options.

## Usage

The container needs privileged permissions to manage the network. When you run the container, you'll need to mount the `tun` device and use the host network.

If you wish to save Tailscale's state, mount `/var/lib/tailscale` so you can save its data.

### Configuration

Set the `AUTH_KEY` environment variable to supply the [auth key](https://tailscale.com/kb/1085/auth-keys) for `tailscale up`. Optionally, you can provide a [command](https://docs.docker.com/engine/reference/run/#cmd-default-command-or-options) which will be passed on to [`tailscale up` as arguments](https://tailscale.com/kb/1080/cli/#up).

If you also want to provide [arguments to `tailscaled`](https://github.com/tailscale/tailscale/blob/effee49e45f2eab681626d2c7ffefbd80f028471/cmd/tailscaled/tailscaled.go#L102) then append these to the command separated with `--`.

For example, using this command would pass the `--advertise-exit-node` argument to `tailscale up` and the `--verbose 1` arguments to `tailscaled`:
```
--advertise-exit-node -- --verbose 1
```

If no `AUTH_KEY` nor command is supplied then `tailscale up` will not be run (but `tailscaled` will still run).

## Example

This would run the container in the background, storing data at `/host/path/data`, supplying an auth key for `up`, and advertising an exit node.
```
docker run -d \
    --name=tailscale \
    -v /host/path/data:/var/lib/tailscale \
    -v /dev/net/tun:/dev/net/tun \
    --network=host \
    --privileged \
    -e AUTH_KEY=ts123123 \
    jonoh/tailscale \
    --advertise-exit-node
```

See docker-compose.yml file for a Docker Compose example.

## Tags

Tags are based on the Tailscale release version.
