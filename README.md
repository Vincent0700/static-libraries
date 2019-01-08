# static-libraries

This repo contains a series of scripts of various tools. Not all tools are
available for every platform or architecture.  Please [file an issue][1]
if you want a new tool or a tool on a new platform.

## Current List of Tools

- [sourcelist-switcher](#doc-sourcelist-switcher)


## Documents

### `&0x01` <span id="doc-sourcelist-switcher">sourcelist-switcher</span>
change source mirror to whatever you want

#### @use:

```bash
# please add sudo if you are not root
$ apt install wget apt-transport-https
$ apt install bc
$ bash -c "$(wget -q -O - https://raw.githubusercontent.com/Vincent0700/static-libraries/master/source/sourcelist-switcher/run.sh)"
```

#### @support platform:

- ubuntu 14.04 trusty
- ubuntu 16.04 xenial
- ubuntu 18.04 boinc


[1]: https://github.com/Vincent0700/static-libraries/issues/new
