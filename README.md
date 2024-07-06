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

## CVEs

As always, 0 CVEs c/o Wolfi:

`Dockerfile`:
```
$ grype 51e4fdf0ce56
 ✔ Vulnerability DB                [updated]
 ✔ Loaded image                                                                                                                                                                                                                                                              51e4fdf0ce56
 ✔ Parsed image                                                                                                                                                                                                   sha256:51e4fdf0ce56d74aca5189060cea324b40ff32ab5ac6b00586ace223b0a05ccb
 ✔ Cataloged contents                                                                                                                                                                                                    53838ae0b250a4faa32d416517daf77f05324cd89c5ef71b584d632cdf0a6be5
   ├── ✔ Packages                        [91 packages]
   ├── ✔ File digests                    [10,482 files]
   ├── ✔ File metadata                   [10,482 locations]
   └── ✔ Executables                     [154 executables]
 ✔ Scanned for vulnerabilities     [0 vulnerability matches]
   ├── by severity: 0 critical, 0 high, 0 medium, 0 low, 0 negligible
   └── by status:   0 fixed, 0 not-fixed, 0 ignored
No vulnerabilities found
```

Apko:
```
$ grype f8ab6f381fb2
 ✔ Vulnerability DB                [no update available]
 ✔ Loaded image                                                                                                                                                                                                                                                              f8ab6f381fb2
 ✔ Parsed image                                                                                                                                                                                                   sha256:f8ab6f381fb2ab8732bf46dd531232d8b36d45a2a3fb6033b2d02297b6c14f22
 ✔ Cataloged contents                                                                                                                                                                                                    f2e76e59a2eebffe1199dd9092fbd55950b52ba0fbc574b9700ce68c90fdb579
   ├── ✔ Packages                        [90 packages]
   ├── ✔ File digests                    [10,431 files]
   ├── ✔ File metadata                   [10,431 locations]
   └── ✔ Executables                     [141 executables]
 ✔ Scanned for vulnerabilities     [0 vulnerability matches]
   ├── by severity: 0 critical, 0 high, 0 medium, 0 low, 0 negligible
   └── by status:   0 fixed, 0 not-fixed, 0 ignored
No vulnerabilities found
```

```
$ grype 7cdd31a7ed5d
 ✔ Vulnerability DB                [no update available]
 ✔ Loaded image                                                                                                                                                                                                                                                              7cdd31a7ed5d
 ✔ Parsed image                                                                                                                                                                                                   sha256:7cdd31a7ed5da6ff73883102e29a35154846aaa31c8b1e4c43cbb0232e732a1a
 ✔ Cataloged contents                                                                                                                                                                                                    6ff60bb1d7b9f157de73f113b20912696f0f3c7cfc23ffdd1e292b6bd678262a
   ├── ✔ Packages                        [90 packages]
   ├── ✔ File digests                    [10,464 files]
   ├── ✔ File metadata                   [10,464 locations]
   └── ✔ Executables                     [141 executables]
 ✔ Scanned for vulnerabilities     [0 vulnerability matches]
   ├── by severity: 0 critical, 0 high, 0 medium, 0 low, 0 negligible
   └── by status:   0 fixed, 0 not-fixed, 0 ignored
No vulnerabilities found
```
