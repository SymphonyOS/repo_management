#!/bin/sh
# Repo Rebuild Script
rm -Rf /root/.aptly;
aptly repo create -distribution=symphonyos -component=dev symphonyos;
aptly repo add symphonyos debs-dev;
aptly snapshot create symphony-1 from repo symphonyos;
aptly publish snapshot symphony-1;
rm -Rf /var/www/public/dev;
mkdir /var/www/public/dev;
cp -Rf .aptly/public/* /var/www/public/dev/.;
#cp .gnupg/pubring.gpg /var/www/public/symphony-gpg.key;
