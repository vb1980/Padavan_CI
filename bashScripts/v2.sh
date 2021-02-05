#!/bin/bash
v2PkgVer="4.34.0"
v2PkgPath=$1
echo $v2PkgPath
echo $v2PkgVer
cp -f v2ray/v2ray-core-$v2PkgVer.tar.gz $v2PkgPath
sed -i "s#V2ray_VERSION := 4.31.2#V2ray_VERSION := $v2PkgVer#g" $(v2PkgPath)/Makefile
#sed -i "s#V2ray_URL := https://codeload.github.com/v2ray/v2ray-core/tar.gz/v\$(V2ray_VERSION)#V2ray_URL := https://codeload.github.com/v2fly/v2ray-core/tar.gz/v\$(V2ray_VERSION)#g" $(v2PkgPath)/Makefile
