#!/bin/sh
cd ~

# git files
git add -f .gitignore
git commit -m "fix: .gitignore file"

# bash/sh files
git add -f .bashrc
git commit -m "fix: .bashrc file"

# nvim files
git add -f .config/nvim/init.lua
git commit -m "fix: .config/nvim/init.lua file"
git add -f .config/nvim/lua/*
git commit -m "fix: .config/nvim/lua file"
git add -f .config/nvim/*.lua
git commit -m "fix: .config/nvim file"

# git add other
git add .
git commit -m "clean up"
