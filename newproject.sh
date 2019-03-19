#!/bin/bash

HALDIR=components/mrubyc/src/hal
ESP32HALDIR=components/mrubyc/src/hal_esp32
DSTMAKEDIR=components/mrubyc
SRCMAKEDIR=templates

echo "preparing new project..."

if [ ! -e $HALDIR ] ; then
 echo "install -D -t $HALDIR $ESP32HALDIR/hal.*";
 install -D -t $HALDIR $ESP32HALDIR/hal.*;
else
 echo "exist hal"
fi

# Makeファイル作成
echo "create MakeFile";
cat << EOF > Makefile
#
# This is a project Makefile. It is assumed the directory this Makefile resides in is a
# project subdirectory.
#

PROJECT_NAME := $1

EOF

cat << 'EOF' >> Makefile
include $(IDF_PATH)/make/project.mk
EOF

echo "install $SRCMAKEDIR/component.mk $DSTMAKEDIR/component.mk";
install $SRCMAKEDIR/component.mk $DSTMAKEDIR/component.mk;

echo "...done"
