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
