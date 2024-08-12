# jekyll-in-a-can

🧪🥫 - it's Jekyll in a container

## usage

change directories into your project's root directory, then run it

```shell
docker run -it --rm \
  --volume="$PWD:/work" \
  -p 4000:4000 \
  ghcr.io/some-natalie/jekyll-in-a-can:latest
```

sometimes it's helpful to clear the previous build's stuff first, then run it

```shell
rm -rf Gemfile.lock _site .jekyll-cache
```

## notes

it's rebuilt once a week automatically.  versions of gems, etc, are unpinned by default and will float to latest or whatever is in the gemfile.  the base image is Chainguard's ruby development image's `latest` tag, which is rebuilt daily.

this isn't for production use, just local development of static sites.

images older than 2 months are deleted automatically.
