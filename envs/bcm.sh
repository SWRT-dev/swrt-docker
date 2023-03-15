#!/bin/sh

mkdir -p /opt/toolchains/
ln -sf ~/bcmhnd-toolchains/crosstools-aarch64-gcc-5.3-linux-4.1-glibc-2.22-binutils-2.25 /opt/toolchains/
ln -sf ~/bcmhnd-toolchains/crosstools-arm-gcc-5.3-linux-4.1-glibc-2.22-binutils-2.25 /opt/toolchains/
ln -sf ~/bcmhnd-toolchains/crosstools-aarch64-gcc-5.3-linux-4.1-glibc-2.24-binutils-2.25 /opt/toolchains/
ln -sf ~/bcmhnd-toolchains/crosstools-aarch64-gcc-5.5-linux-4.1-glibc-2.26-binutils-2.28.1 /opt/toolchains/
ln -sf ~/bcmhnd-toolchains/crosstools-arm-gcc-5.3-linux-4.1-glibc-2.24-binutils-2.25 /opt/toolchains/
ln -sf ~/bcmhnd-toolchains/crosstools-arm-gcc-5.5-linux-4.1-glibc-2.26-binutils-2.28.1 /opt/toolchains/
ln -sf ~/bcmhnd-toolchains/crosstools-gcc-5.3-linux-4.1-uclibc-1.0.12-glibc-2.24-binutils-2.25 /opt/toolchains/
ln -sf ~/bcmhnd-toolchains/crosstools-aarch64-gcc-9.2-linux-4.19-glibc-2.30-binutils-2.32 /opt/toolchains/
ln -sf ~/bcmhnd-toolchains/crosstools-arm-gcc-9.2-linux-4.19-glibc-2.30-binutils-2.32 /opt/toolchains/
ln -sf ~/bcm-toolchains/hndtools-arm-linux-2.6.36-uclibc-4.5.3 /opt/toolchains/
mkdir -p /projects/
mkdir -p /projects/bca/
mkdir -p /projects/bca/tools/
mkdir -p /projects/bca/tools/linux/
mkdir -p /projects/bca/tools/linux/bin/
ln -sf ~/bcm-toolchains/hndtools-armeabi-2013.11 /projects/bca/tools/linux/
ln -sf ~/bcm-toolchains/fwtag.ini /projects/bca/tools/linux/bin/
ln -sf /projects/bca /projects/hnd
