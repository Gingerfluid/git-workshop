#!/bin/bash -e
# Script to create some local test files and directories for Git Workshop

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

# Check for GIT install and print a warning if not installed/working
echo -e "$yellow Checking prerequisite: GIT $reset"
git --version >/dev/null 2>&1 || { echo >&2 "We require Git for this workshop but it's not installed.  Aborting."; exit 1; }
gitversion=$(git --version)

echo -e "$yellow - $gitversion $reset"
echo
# Create a test repo and add some test files to work with
echo -e "$yellow Setting up Git Workshop directory and files:$reset"
mkdir -p ~/MyTestRepo1/ && 
cd ~/MyTestRepo1/ && 
touch generalFile{1..9}.txt secretFile.yaml specialFile.xs privateKeyFile.txt

if [ -x "$(command -v tree)" ]; then
  treeview=$(tree --noreport ~/MyTestRepo1/)
  echo -e "$green $treeview $reset"
  echo
else
  echo -e "$green Test Files Created $reset"
  echo
fi

# Output status and further instructions
echo -e "$yellow - To continue this workshop, change directory as below:
    cd ~/MyTestRepo1/ $reset"
