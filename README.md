# wolfi-workspace
Dockerfile/Apko configs for a minimal Wolfi workspace

## Apko

Rootless, declarative implementation. Useful when working with projects such as [bincapz](https://github.com/chainguard-dev/bincapz/) since all of the provided packages are used by this project.

Usage:
```
make apko-build
make apko-workspace
```

## Dockerfile

Fancier implementation that allows for `sudo` access to `apk` and `vim` along with a colorized terminal. Useful when needing to add additional packages.

Usage:
```
make build
make workspace
```

## Volume/Working Directory

By default, the current working directory is bind-mounted as a volume in the container. The working directory can be changed by updating the `docker run` command:
```
docker run --rm -it -v $(pwd):<container path>:ro -w <container path> workspace:latest
```

To affect change on the host filesystem, remove the `:ro` option from the `-v` arguments.
