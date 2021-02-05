#!/bin/bash
#!/bin/bash
v2ver="4.34.0"
v2path=$1
echo $v2path
echo $v2ver
cp -f v2ray/v2ray-core-$v2ver.tar.gz $v2path
sed -i "s#V2ray_VERSION := 4.31.2#V2ray_VERSION := $v2ver#g" $v2path/Makefile
#sed -i "s#V2ray_URL := https://codeload.github.com/v2ray/v2ray-core/tar.gz/v\$(V2ray_VERSION)#V2ray_URL := https://codeload.github.com/v2fly/v2ray-core/tar.gz/v\$(V2ray_VERSION)#g" $(v2PkgPath)/Makefile
