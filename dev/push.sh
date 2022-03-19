echo
echo "  [GIT AUTOMATION SCRIPT]"
echo
echo "  [WARNING] Always use this script from"
echo "    within your Dev.git root directory."
echo
echo
echo "  Checkout 'main' for all repositories"
echo
echo

# CHECKOUT Developer Environment Root
dev.goto && git checkout main

# CHECKOUT External Mains
dev.goto && cd Ext/Overlord && git checkout main
dev.goto && cd Ext/Client && git checkout main

# CHECKOUT Internal Mains
dev.goto && cd Int/Staging && git checkout main

# CHECKOUT System Mains
dev.goto && git checkout main

# [PULL] Repository & Recurse Submodules
echo
echo
echo "  Pull 'main' for all repositories"
echo
dev.goto && git pull --recurse-submodule
echo
echo
cd Ext/Overlord && git pull --recurse-submodule && dev.goto
cd Ext/Client && git pull --recurse-submodule && dev.goto
cd Int/Staging && git pull --recurse-submodule && dev.goto
echo
echo
cd Sys && git pull --recurse-submodule && cd ..

# Commit Changes
echo
echo
echo "  Commit all changes"
echo

# PUSH External Mains
cd Ext/Overlord
git add . && git commit -m "Auto Commit" && git push
cd ../Client
git add . && git commit -m "Auto Commit" && git push
cd ../..

# PUSH Internal Mains
cd Int/Staging
git add . && git commit -m "Auto Commit" && git push
cd ../..

# PUSH System Mains
cd Sys
git add . && git commit -m "Auto Commit" && git push
cd ..

# PUSH Developer Environment Root
git add . && git commit -m "Auto Commit" && git push

# Done
echo
echo
echo "  Done!"
echo
