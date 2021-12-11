# Arch User Repository

Installing packages from the AUR is a relatively simple process.

[Archwiki Documentation for AUR](https://wiki.archlinux.org/title/Arch_User_Repository).

Essentially:

1. Acquire the build files, including `PKGBUILD`.
2. Run `makepkg` in the directory where the files are saved.
3. Run `pacman -U package_file` to install the package onto your system.

