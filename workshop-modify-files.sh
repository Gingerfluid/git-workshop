#!/bin/bash -e
# Script to modify some local test files and directories for Git Workshop

# Add some formatting based on OS Type.
# Darwin = Mac, Cygin = cygwin for windows, msys = git for windows.  All should work with colours.
if [[ "$OSTYPE" == darwin* ]] || [[ "$OSTYPE" == cygwin ]] || [[ "$OSTYPE" == msys ]]; then
  green="\\033[32m"
  yellow="\\033[33m"
  reset="\\033[0m"
elif [ "$OSTYPE" == "linux-gnu" ]; then
  green="\\e[32m"
  yellow="\\e[33m"
  reset="\\e[0m"
else
  green=""
  yellow=""
  reset=""
fi

# Modify some test files by adding a shopping list of items
echo -e "$yellow Adding \"Shopping List\" Items to General Files: $reset"

shoppingList=" My Shopping list

 Sugar
 Coffee
 Teabags
 Milk"

echo -e "$green"
echo -e "$shoppingList" | tee -a ~/MyTestRepo1/generalFile{1..9}.txt
echo
echo -e "$yellow - To continue this workshop, change directory as below:
    cd ~/MyTestRepo1/ $reset"
