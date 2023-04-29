#!/bin/bash

set -eoux pipefail

# Add link to the Desktop.
if [ ! -f $HOME/Desktop/ImageJ.desktop ]
then
  mkdir -p $HOME/Desktop && ln -s /helx/ImageJ.desktop $HOME/Desktop/ImageJ.desktop
fi
