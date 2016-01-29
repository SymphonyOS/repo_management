#!/bin/sh
# Repo Rebuild Script
rm -Rf /root/.aptly;
aptly repo create -distribution=symphonyos -component=main symphonyos;
aptly repo add symphonyos debs;
aptly snapshot create symphony-1 from repo symphonyos;
aptly publish snapshot symphony-1;
rm -Rf /var/www/public;
cp -Rf .aptly/public /var/www/.;
cp .gnupg/pubring.gpg /var/www/public/symphony-gpg.key;
