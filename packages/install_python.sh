#!/bin/bash

env_name="$1"
version="$2"
install_dir="$3/envs/$env_name/bin"

# Define URL
url="https://www.python.org/ftp/python/$version/Python-$version.tgz"

# Download Python version
wget "$url" -O "$install_dir/Python-$version.tgz" || {
    echo "Error: Unable to download Python $version."
    exit 1
}

# Extract tarball
tar -xzf "$install_dir/Python-$version.tgz" -C "$install_dir" || {
    echo "Error: Unable to extract Python $version."
    exit 1
}

# Cleanup
# rm "$install_dir/Python-$version.tgz"
# echo "Python $version installed in $install_dir."