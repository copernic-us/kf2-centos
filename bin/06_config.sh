#!/bin/sh

set -e

# install crudini
apt -y install epel-release
apt -y install crudini

# deploy the initial config
cp -R share/Config ${STEAM_HOME}/

# fix ownership
chown -R steam.steam ${STEAM_HOME}/Config

# fix selinux context
restorecon -rv ${STEAM_HOME}/Config

# easy access to stock config files
sudo -u steam sh -c 'ln -s ~/Steam/KF2Server/KFGame/Config ~/Config/Internal'
