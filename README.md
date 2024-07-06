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

Less rigid implementation that allows for `sudo` access to `apk` and `vim` (though still relatively hardened) along with a colorized terminal. Useful when needing to add additional packages.

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

As always, 0 CVEs c/o Wolfi (these are simply a point-in-time reference for display purposes):

`Dockerfile`:
```
grype workspace:latest
 ✔ Vulnerability DB                [no update available]
 ✔ Loaded image                                                                                                                                                                                                                                                          workspace:latest
 ✔ Parsed image                                                                                                                                                                                                   sha256:c18f37e2086ca622a1570aa0f9bbe8f563c63599d1f8948648f1c70b99abad08
 ✔ Cataloged contents                                                                                                                                                                                                    bd8a14d3d83d77ee575a255b0c32df2a5ad23d0555ea0a6ad6d10800d1af64cd
   ├── ✔ Packages                        [103 packages]
   ├── ✔ File digests                    [10,765 files]
   ├── ✔ File metadata                   [10,765 locations]
   └── ✔ Executables                     [172 executables]
 ✔ Scanned for vulnerabilities     [0 vulnerability matches]
   ├── by severity: 0 critical, 0 high, 0 medium, 0 low, 0 negligible
   └── by status:   0 fixed, 0 not-fixed, 0 ignored
No vulnerabilities found
```

Apko:
```
grype workspace:latest-amd64
 ✔ Vulnerability DB                [no update available]
 ✔ Loaded image                                                                                                                                                                                                                                                    workspace:latest-amd64
 ✔ Parsed image                                                                                                                                                                                                   sha256:81f2753874bc454252f7621b52b36e921a2414f78238c09d8e8c5b79b7fb7637
 ✔ Cataloged contents                                                                                                                                                                                                    0ee483804875dcdee6c883b3b8fb989460aa072640fa68c07f2fbdf8b401c521
   ├── ✔ Packages                        [102 packages]
   ├── ✔ File digests                    [10,714 files]
   ├── ✔ File metadata                   [10,714 locations]
   └── ✔ Executables                     [159 executables]
 ✔ Scanned for vulnerabilities     [0 vulnerability matches]
   ├── by severity: 0 critical, 0 high, 0 medium, 0 low, 0 negligible
   └── by status:   0 fixed, 0 not-fixed, 0 ignored
No vulnerabilities found
```

```
grype workspace:latest-arm64
 ✔ Vulnerability DB                [no update available]
 ✔ Loaded image                                                                                                                                                                                                                                                    workspace:latest-arm64
 ✔ Parsed image                                                                                                                                                                                                   sha256:d46d4606272ed12aa42fb42d21777d7a86f7bc76cdf17b7023a697b89ba555b5
 ✔ Cataloged contents                                                                                                                                                                                                    e1692493fe661542b421b797c9ac4408463264d6cdc8fe01e297b0e619426dd5
   ├── ✔ Packages                        [102 packages]
   ├── ✔ File digests                    [10,747 files]
   ├── ✔ File metadata                   [10,747 locations]
   └── ✔ Executables                     [159 executables]
 ✔ Scanned for vulnerabilities     [0 vulnerability matches]
   ├── by severity: 0 critical, 0 high, 0 medium, 0 low, 0 negligible
   └── by status:   0 fixed, 0 not-fixed, 0 ignored
No vulnerabilities found
```
