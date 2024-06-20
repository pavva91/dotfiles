#!/usr/bin/env bash

if [[ "$(grep -c Debian < /etc/os-release)" == 2 ]] || [[ "$(grep -c Ubuntu < /etc/os-release)" == 2 ]]; then
    # For Debian
    # export "$JAVA_HOME"=/
fi

if [ ! -d ~/.m2 ]; then
    mkdir ~/.m2
fi

if [ ! -f ~/.m2/settings.xml ]; then
    ln -s /mnt/c/Users/vmattioli/.m2/settings.xml ~/.m2/settings.xml
fi
