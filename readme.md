
# Arch User Repository

Installing packages from the AUR is a reltively simple process. 

![Archwiki Documentation for AUR](wiki.archlinux.org/title/Arch_User_Repository).

Essentially:

1. Acquire the build files, includeing PKGBUILD.
2. Run makepkg in the directory where the files are saved. 
3. Run ``pacman -U package_file`` to install the package onto your system.

