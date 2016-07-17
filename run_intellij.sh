#!/bin/bash

cd /ide/work

if [ -d "/ide/identity/.IdeaIC15" ]; then
  # user already has IDEA settings on host, just copy them
  cp -R /ide/identity/.IdeaIC15 /home/ide
fi

if [ -d "/ide/work/.idea" ]; then
  # user already has gocd project settings
  echo "Detected existing gocd IDEA project in /ide/work"
fi

/opt/intellij/bin/idea.sh /ide/work
