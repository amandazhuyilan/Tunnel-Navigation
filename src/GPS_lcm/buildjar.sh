#!/bin/sh

# try to automatically determine where the LCM java file is
LCM_JAR=`pkg-config --variable=classpath lcm-java`
if [ $? != 0 ] ; then
    if [ -e /usr/local/share/java/lcm.jar ] ; then
        LCM_JAR=/usr/local/share/java/lcm.jar
    else
        if [ -e ../../lcm-java/lcm.jar ] ; then
            LCM_JAR=../../lcm-java/lcm.jar
        fi
    fi
fi

lcm-gen -j *.lcm

javac -cp $LCM_JAR ./gps_lcm/*.java

jar cf GPS_struct_type.jar ./gps_lcm/*.class
