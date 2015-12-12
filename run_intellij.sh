#!/bin/bash

cd /ide/work

if [ -d "/ide/identity/.IdeaIC15" ]; then
  # user already has IDEA settings on host, just copy them
  cp -R /ide/identity/.IdeaIC15 /home/ide
else
  # copy the settings provided with image
  cp -R /home/ide/IDEA/IdeaIC15 /home/ide/.IdeaIC15
fi

if [ -d "/ide/work/.idea" ]; then
  # user already has gocd project settings
  echo "Detected existing gocd IDEA project in /ide/work"
else
  # copy the settings provided with image
  cp -R /home/ide/IDEA/gocd /home/ide/.idea
fi

/opt/intellij/bin/idea.sh /ide/work
