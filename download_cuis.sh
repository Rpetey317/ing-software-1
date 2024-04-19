#!/bin/bash

# Remove the previous cuis folder if it exists
if [ -d "cuis" ]; then
  rm -rf cuis
fi

# Get the URL of the latest release
release_url=$(curl -s https://api.github.com/repos/Cuis-University/Cuis-University/releases/latest | grep 'browser_' | cut -d\" -f4)

# Download the linux64.tar.gz file from the latest release
for url in $release_url
do
  if [[ $url == *"linux64.tar.gz"* ]]; then
    wget $url
  fi
done

# Unzip the file
tar -xzf linux64.tar.gz

# remove previous cuis folder if it exists
if [ -d "cuis" ]; then
    rm -rf cuis
fi

# Rename the folder to cuis
mv linux64 cuis

# Cleanup
rm linux64.tar.gz
rm ._linux64