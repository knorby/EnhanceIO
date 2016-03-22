#!/bin/bash

# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

SCRIPT_DIR=$(cd $(dirname $0); pwd)

cd $SCRIPT_DIR/Driver/enhanceio/
make && make install

cd $SCRIPT_DIR
cp $SCRIPT_DIR/CLI/eio_cli /sbin/
chmod 700 /sbin/eio_cli

cp $SCRIPT_DIR/CLI/eio_cli.8 /usr/share/man/man8/
