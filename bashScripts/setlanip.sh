#!/bin/sh
defaultfile=$1
lanip=$2
oc1=${lanip%%.*}
x=${lanip#*.*}
oc2=${x%%.*}
x=${x#*.*}
oc3=${x%%.*}
dhcpfrom=$oc1"."$oc2"."$oc3".100"
dhcpto=$oc1"."$oc2"."$oc3".244"
sed -i "s/\"192.168.2.1\"/\"$lanip\"/g" $defaultfile
sed -i "s/\"192.168.2.100\"/\"$dhcpfrom\"/g" $defaultfile
sed -i "s/\"192.168.2.244\"/\"$dhcpto\"/g" $defaultfile
