# Troubleshooting

## `/docker-entrypoint.d/00-make-certs.sh: not found`

### Error message when starting the containers

```shell
$ /docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
$ /docker-entrypoint.sh: Launching /docker-entrypoint.d/00-make-dev-certs.sh
$ /docker-entrypoint.sh: line 22: /docker-entrypoint.d/00-make-certs.sh: not found
```

### Possible reasons for error:

* Differences in line endings between Unix and Windows

### Lösung:

The line end of the shell scripts must be Unix conform (LF) and not as with Windows standard (CRLF). For this purpose
the `.editorconfig` is filled accordingly. Nevertheless, problems can occur. Therefore, it is recommended to adjust the
Git configuration globally.

```shell
$ git config --global core.autocrlf false
```
