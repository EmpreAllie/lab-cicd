#!/bin/bash
set -e

echo "-- STAGE: Authomatic DEB package creation --"

mkdir -p pkg/usr/local/bin
mkdir -p pkg/DEBIAN

cp src/app pkg/usr/local/bin/
cp DEBIAN/control pkg/DEBIAN/

dpkg-deb --build pkg pogorelov-lab-v1.deb

echo "DEB Package created successfully"
