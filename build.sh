#!/bin/bash

# Create a dedicated directory for the package inside the conda environment
export EBA3_HOME=$PREFIX/share/eba3
mkdir -p $EBA3_HOME
mkdir -p $PREFIX/bin

# Copy the main executable and required library folders
cp EBA.pl $EBA3_HOME/
cp -r EBALib $EBA3_HOME/

# Ensure the executable has run permissions
chmod +x $EBA3_HOME/EBA.pl

# Create a symlink in the bin folder so it is accessible from anywhere in PATH
ln -s $EBA3_HOME/EBA.pl $PREFIX/bin/EBA.pl
