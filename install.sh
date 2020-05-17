#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#rm  ~/.config/nvim/init.vim
ln -svf $BASEDIR/nvim/init.vim ~/.config/nvim/init.vim

PLUGIN_DIR=~/.config/nvim/plugin/
AFTER_DIR=~/.config/nvim/after/plugin/

if [ ! -d $PLUGIN_DIR ]; then
  mkdir $PLUGIN_DIR
fi
ln -svf $BASEDIR/nvim/plugin/* $PLUGIN_DIR

if [ ! -d $AFTER_DIR ]; then
  mkdir $AFTER_DIR
fi
ln -svf $BASEDIR/nvim/after/plugin/* $AFTER_DIR

#i3
ln -svf $BASEDIR/i3/config ~/.config/i3/config
