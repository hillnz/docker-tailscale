# docker-tailscale

An unofficial [Tailscale](https://tailscale.com) Docker image.

It's based on the official image, but it also includes an entrypoint script with configuration options.

## Usage

The container needs privileged permissions to manage the network. When you run the container, you'll need to mount the `tun` device and use the host network.

If you wish to save Tailscale's state, ensure you mount `/var/lib/tailscale` so you can save this.

You can configure Tailscale's behaviour using the enviornment variables below.

### Environment Variables

If `AUTH_KEY` or `UP_ARGS` are set then `tailscale up` will be run automatically at container start.

Name | Default | Purpose
--- | --- | ---
AUTH_KEY | _none_ | Use this [auth key](https://tailscale.com/kb/1085/auth-keys) for `tailscale up`.
UP_ARGS | _none_ | Additional arguments to be passed to `tailscale up`.
DAEMON_ARGS | _none_ | Additional arguments to be passed to `tailscaled`.

## Example

```
docker run -d \
    --name=tailscale \
    -v /host/path/data:/var/lib/tailscale \
    -v /dev/net/tun:/dev/net/tun \
    --network=host \
    --privileged \
    -e AUTH_KEY=ts123123 \
    jonoh/tailscale
```

See docker-compose.yml file for a Docker Compose example.

## Tags

Tags are based on the Tailscale release version.
