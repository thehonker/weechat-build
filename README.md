# weechat-build

Containerized builds of [WeeChat](https://github.com/weechat/weechat), compiled from source for `linux/amd64` and `linux/aarch64`.

## Images

Images are published to `ghcr.io/thehonker/weechat` with two base variants and two flavors:

| Base | Flavor | Description |
|------|--------|-------------|
| Alpine | slim | WeeChat only, no scripting |
| Alpine | thiq | WeeChat + all scripting language support (Python, Perl, Ruby, Lua, Tcl, Guile, Aspell/Enchant) |
| Debian | slim | WeeChat only, no scripting |
| Debian | thiq | WeeChat + all scripting language support |

Each variant has nightly and stable tracks:

### Alpine Slim

alpine-slim-nightly: _(not yet built)_ \
alpine-slim-stable: _(not yet built)_

```
ghcr.io/thehonker/weechat:alpine-slim-latest
ghcr.io/thehonker/weechat:alpine-slim-stable
```

### Alpine Thiq

alpine-thiq-nightly: _(not yet built)_ \
alpine-thiq-stable: _(not yet built)_

```
ghcr.io/thehonker/weechat:alpine-thiq-latest
ghcr.io/thehonker/weechat:alpine-thiq-stable
```

### Debian Slim

debian-slim-nightly: _(not yet built)_ \
debian-slim-stable: _(not yet built)_

```
ghcr.io/thehonker/weechat:debian-slim-latest
ghcr.io/thehonker/weechat:debian-slim-stable
```

### Debian Thiq

debian-thiq-nightly: _(not yet built)_ \
debian-thiq-stable: _(not yet built)_

```
ghcr.io/thehonker/weechat:debian-thiq-latest
ghcr.io/thehonker/weechat:debian-thiq-stable
```

### Tags

Each build also gets a datestamp tag (e.g. `alpine-slim-20260829`) and a ref tag (e.g. `alpine-slim-a3f7c2d` for nightlies, `alpine-slim-v4.6.0` for stable).

## Running

```bash
docker run --rm -it \
  -v /path/to/config:/home/weechat/.config/weechat \
  ghcr.io/thehonker/weechat:alpine-slim-latest
```

All arguments passed to `docker run` after the image name are forwarded to WeeChat. All environment variables are passed through.

## Patches

Drop `*.patch` files into `patches/alpine/` or `patches/debian/` and they'll be automatically applied to the WeeChat source before build. Patches are applied with `git apply` in order.

## Building locally

```bash
git clone https://github.com/weechat/weechat.git src/weechat
docker build -t weechat:local --build-arg FLAVOR=slim -f src/Dockerfile.alpine src/
docker build -t weechat:local-thiq --build-arg FLAVOR=thiq -f src/Dockerfile.alpine src/
```
