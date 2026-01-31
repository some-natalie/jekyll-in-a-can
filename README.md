# jekyll-in-a-can

🧪🥫 - it's Jekyll in a container

> [!WARNING]  
> 🎄 Merry Christmas! 🎄  Ruby 4.0.0 was released and not all Jekyll themes published as Gems are cool with that yet.  Use `latest-ruby3` for the last good build using Ruby 3.4.

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

it needs to be in the same directory as your `Gemfile` in order to build the site.  it'll then run a local server for development.

## notes

it's rebuilt once a week automatically.  versions of gems, etc, are unpinned by default and will float to latest or whatever is in the gemfile.  the base image is Chainguard's ruby development image's `latest` tag, which is rebuilt daily.

this isn't for production use, just local development of static sites.

images older than 2 months are deleted automatically.

> [!NOTE]
> [![OpenSSF Scorecard](https://api.securityscorecards.dev/projects/github.com/some-natalie/jekyll-in-a-can/badge)](https://securityscorecards.dev/viewer/?uri=github.com/some-natalie/jekyll-in-a-can) (more about this metric and what it means at [securityscorecards.dev](https://securityscorecards.dev/)) - track progress on anything surfaced by it [here](https://github.com/some-natalie/jekyll-in-a-can/issues)
