# Configuring the build

## Setup Yocto environment

* Install the `reop` utility:
```
mkdir ~/bin
curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
PATH=${PATH}:~/bin
```

* WorkDir
```
mkdir compulab-freescale-bsp && cd compulab-freescale-bsp
```
* Set CompuLab machine and repo name environmet varables:

Machine | Environment |
--- | --- |
~~`ucm-imx8m-mini`~~ | ~~`export MACHINE=ucm-imx8m-mini LREPO=compulab-bsp-setup-imx8mm.xml`~~
~~`mcm-imx8m-mini`~~ | ~~`export MACHINE=mcm-imx8m-mini LREPO=compulab-bsp-setup-imx8mm.xml`~~
~~`iot-gate-imx8`~~  | ~~`export MACHINE=iot-gate-imx8 LREPO=compulab-bsp-setup-iot.xml`~~
`ucm-imx8m-plus` | `export MACHINE=ucm-imx8m-plus LREPO=compulab-bsp-setup-imx8mp.xml`
~~`som-imx8m-plus`~~ | ~~`export MACHINE=som-imx8m-plus LREPO=compulab-bsp-setup-imx8mp.xml`~~
~~`cl-som-imx7`~~ | ~~`export MACHINE=cl-som-imx7 LREPO=compulab-bsp-setup-imx7.xml`~~

## Initialize repo manifests

* FSL Community
```
repo init -u https://github.com/Freescale/fsl-community-bsp-platform -b kirkstone
```

* CompuLab
```
mkdir -p .repo/local_manifests
wget --directory-prefix .repo/local_manifests https://raw.githubusercontent.com/compulab-yokneam/compulab-fslc-bsp/kirkstone/scripts/${LREPO}
```

* Sync Them all
```
repo sync
```

## Setup build environment

* Initialize the build environment and build:

Distro | Setup command  | Build command |
--- | --- | --- |
fslc-xwayland | DISTRO=fslc-xwayland source compulab-setup-environment build-fslc-${MACHINE} | ```bitbake -k fsl-image-multimedia-full```
fslc-framebuffer | DISTRO=fslc-framebuffer compulab-setup-environment build-fslc-${MACHINE} | ```bitbake -k core-image-full-cmdline```

* Get back to the build environment:
```
source compulab-setup-environment build-fslc-${MACHINE}
```
