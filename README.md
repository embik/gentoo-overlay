# embik/gentoo-overlay

This is my personal overlay for Gentoo Linux, containing ebuild scripts that are missing from Portage's main tree. Ebuilds may be removed or not updated once I don't use the application in question anymore, so please use with caution.

## How to use

Be sure to emerge `app-portage/layman` before. It requires the `git` useflag to work with this overlay. Then run

```shell
$ sudo layman -o https://raw.github.com/embik/gentoo-overlay/master/overlay.xml -f -a embik-gentoo-overlay
```

To update the overlay run

```shell
sudo layman -S
```
