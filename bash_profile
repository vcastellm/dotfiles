#!/bin/bash

if [ -f /etc/profile ]; then
  . /etc/profile
fi

if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi
