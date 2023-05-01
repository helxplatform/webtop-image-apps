#!/bin/bash

set -eoux pipefail

# Add link to the Desktop.
if [ ! -f $HOME/Desktop/Napari.desktop ]
then
  mkdir -p $HOME/Desktop && ln -s /helx/Napari.desktop $HOME/Desktop/Napari.desktop
fi

# Add link to menu.
if [ ! -f $HOME/.local/share/applications/Napari.desktop ]
then
  mkdir -p $HOME/.local/share/applications && ln -s /helx/Napari.desktop $HOME/.local/share/applications/Napari.desktop
fi
