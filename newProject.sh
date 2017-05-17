#!/bin/sh

# Get project name from argument or user input.
if [ "$#" -eq  "0" ]
then
  read -p "Enter new project name:" name
  echo "Project name is $name"
  echo "Setting up files..."
else
  name = $1
  read -p "Name new project $1? (y/n)" yesno
  if [ $yesno -ne "y" -o "yes"]
  then
    echo "Script aborted."
    exit 1
  else
    echo "Setting up files..."
  fi
fi

# Duplicate skeleton with new project name.
if cd ~/projects/skeleton
then
  cp -r ../skeleton/ ../$name
  mv ../$name/NAME ../$name/$name
  mv ../$name/tests/NAME_tests.py ../$name/tests/$name_tests.py
  rm ../$name/readme.txt
  sed -i -e "s/NAME/$name/g" ../$name/setup.py
  sed -i -e "s/NAME/$name/g" ../$name/tests/$name_tests.py
  sed -i -e "s/projectname/$name/g" ../$name/setup.py
  echo "Setup complete!"
else
  echo "Error! ~home/projects/skeleton does not exist."
  echo "Rename your directories or edit the script."
  echo "Script aborted."
  exit 1
fi
