#!/bin/sh
cd ~
BRANCH_USER="$USER"
BRANCH_HOST="$NAME"
BRANCH="$BRANCH_USER@$BRANCH_HOST"
GIT_PATH="/home/$USER/.git"

# Intialize repository if not exists
if ! [ -d "$GIT_PATH" ]; then
  git init
  git remote add origin git@github.com:oceaster/oceaster
  git pull
  git checkout owen@main
  git checkout -b "$BRANCH"
  git push -f origin "$BRANCH"
  sh ~/.auto.git-add.sh
  git push -f origin "$BRANCH"
fi

# Check Status
git status
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Check Branch
if [ "$CURRENT_BRANCH" != "$BRANCH" ]; then
  git commit -m "merge: prepare for merge"
  sh ~/.auto.git-add.sh
  git commit -m "merge: prepare for merge"

  git pull -f origin "$CURRENT_BRANCH"

  git commit -m "merge: prepare for merge"
  sh ~/.auto.git-add.sh
  git commit -m "merge: prepare for merge"

  git push -f --set-upstream origin "$CURRENT_BRANCH"

  git commit -m "merge: prepare for merge"
  git checkout -b $BRANCH
  git pull -f origin $BRANCH
  git commit -m "merge: prepare for merge"

  git commit -m "merge: prepare for merge"
  sh ~/.auto.git-add.sh
  git commit -m "merge: prepare for merge"

  git commit -m "merge: $CURRENT_BRANCH -> $BRANCH"
  git pull -f origin "$CURRENT_BRANCH"
  git commit -m "merge: $CURRENT_BRANCH -> $BRANCH"

  git commit -m "merge: $CURRENT_BRANCH -> $BRANCH"
  sh ~/.auto.git-add.sh
  git commit -m "merge: $CURRENT_BRANCH -> $BRANCH"

  git commit -m "merge: prepare for merge"
  git push -f --set-upstream origin "$BRANCH"
else
  git commit -m "merge: prepare for merge"
  sh ~/.auto.git-add.sh
  git commit -m "merge: prepare for merge"

  git pull -f origin "$CURRENT_BRANCH"

  git commit -m "merge: prepare for merge"
  sh ~/.auto.git-add.sh
  git commit -m "merge: prepare for merge"

  git push -f --set-upstream origin "$CURRENT_BRANCH"
fi

# add all automatic files
sh /home/$USER/.auto.git-add.sh
git commit -m "merge: prepare for merge"

# merge core branches
if [ $BRANCH != "owen@main" ]; then
  git pull -f origin owen@main
  git add .
  git commit -m "merge: owen@main -> $BRANCH"
  git push -f origin "$BRANCH"
fi

if [ $BRANCH != "owen@laptop" ]; then
  git pull -f origin owen@laptop
  git add .
  git commit -m "merge: owen@laptop -> $BRANCH"
  git push -f origin "$BRANCH"
fi

if [ $BRANCH != "owen@desktop" ]; then
  git pull -f origin owen@desktop
  git add .
  git commit -m "merge: owen@desktop -> $BRANCH"
  git push -f origin "$BRANCH"
fi

# Final Checks
git checkout -b $BRANCH
git push origin $BRANCH
git pull origin $BRANCH
git push origin $BRANCH
