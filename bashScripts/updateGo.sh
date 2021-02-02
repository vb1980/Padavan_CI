#!/bin/bash
#rm -rf /opt/hostedtoolcache/go/1.14.14
#mv /opt/hostedtoolcache/go/1.15.7 /opt/hostedtoolcache/go/1.14.14
goCacheRoot="/opt/hostedtoolcache/go"
goVersions="/opt/GoVersions.txt"
:> $goVersions
chmod 777 $goVersions
goCacheDirs=$(ls -l "$goCacheRoot" | sed '{1!G;h;$!d}' | awk '/^d/ {print $NF}')
for goVersion in $goCacheDirs
do
#echo $goVersion
echo $goVersion >> $goVersions
done
new_ver=`sed -n '1p' $goVersions`
old_ver=`sed -n '2p' $goVersions`
#echo "rm -rf $goCacheRoot/$old_ver"
rm -rf $goCacheRoot/$old_ver
#echo "mv $goCacheRoot/$new_ver $goCacheRoot/$old_ver"
mv $goCacheRoot/$new_ver $goCacheRoot/$old_ver
