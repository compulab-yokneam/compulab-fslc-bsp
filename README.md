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
* Set a CompuLab machine:

CompuLab machine | UCM-iMX8M-Mini | MCM-iMX8M-Mini | iot-gate-imx8 |
--- | --- | --- | --- |
`MACHINE` environment setting| `export MACHINE=ucm-imx8m-mini` |`export MACHINE=mcm-imx8m-mini` |`export MACHINE=iot-gate-imx8` |
`LREPO` environment setting | `LREPO=compulab-bsp-setup.xml` |`LREPO=compulab-bsp-setup.xml` |`LREPO=compulab-bsp-setup-iot.xml` |

## Initialize repo manifests

* FSL Community
```
repo init -u https://github.com/Freescale/fsl-community-bsp-platform -b dunfell
repo sync
```

* CompuLab
```
mkdir -p .repo/local_manifests
cd .repo/local_manifests
wget https://raw.githubusercontent.com/compulab-yokneam/compulab-fslc-bsp/iot-gate-imx8_r0.1/scripts/${LREPO}
cd -
```

* Sync Them all
```
repo sync
cd .repo/local_manifests
ln -sf ../../sources/compulab-fslc-bsp/scripts/${LREPO} .
cd -
```

## Setup build environment

* Initialize the build environment:
```
source sources/compulab-fslc-bsp/tools/setup-env build-fslc-${MACHINE}
```
* Building the image:
```
bitbake -k core-image-full-cmdline
```
