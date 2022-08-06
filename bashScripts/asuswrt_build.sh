#!/bin/sh
ROOTDIR=$(cd `dirname $0`; pwd)
TOOLSDIR=$ROOTDIR/tools;
GCCDIR=$ToolsDIR/buildroot-gcc463
#if [ ! -d "brcm" ];then
#echo "=================COPY-brcm============================="
#cp -f ROOTDIR/tools/brcm brcm
#fi
if [ ! -d "$GCCDIR" ];then
echo "=================EXTRACT-buildroot-gcc463================="
cd $TOOLSDIR
tar xjf buildroot-gcc463_32bits.tar.bz2
fi
if [ -h "/opt/brcm" ];then
sudo rm -rf /opt/brcm
fi
if [ -h "/opt/buildroot-gcc463" ];then
sudo rm -rf /opt/buildroot-gcc463
fi
if [ ! -h "/opt/brcm" ];then
sudo ln -s $TOOLSDIR/brcm /opt/brcm
fi
if [ ! -h "/opt/buildroot-gcc463" ];then
sudo ln -s $TOOLSDIR/buildroot-gcc463 /opt/buildroot-gcc463
fi
export PATH=/opt/brcm/hndtools-mipsel-linux/bin:$PATH
export PATH=/opt/brcm/hndtools-mipsel-uclibc/bin:$PATH
export PATH=/opt/buildroot-gcc463/bin:$PATH
cd $ROOTDIR/release/src/router/libnfnetlink-1.0.1
autoreconf -vfi
cd $ROOTDIR/release/src-ra-5010
make $1
