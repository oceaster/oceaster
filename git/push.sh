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
git checkout main

# CHECKOUT External Mains
cd Ext/Overlord
git checkout main
cd ../Client
git checkout main
cd ../..

# CHECKOUT Internal Mains
cd Int/Staging
git checkout main
cd ../..

# CHECKOUT System Mains
cd Sys
git checkout main
cd ..

# Pull Repository & Recurse Submodules
echo
echo
echo "  Pull 'main' for all repositories"
echo
git pull --recurse-submodule

# Commit Changes
echo
echo
echo "  Commit all changes"
echo

# COMMIT External Mains
cd Ext/Overlord
git add . && git commit -m "Auto Commit" && git push
cd ../Client
git add . && git commit -m "Auto Commit" && git push
cd ../..

# COMMIT Internal Mains
cd Int/Staging
git add . && git commit -m "Auto Commit" && git push
cd ../..

# COMMIT System Mains
cd Sys
git add . && git commit -m "Auto Commit" && git push
cd ..

# COMMIT Developer Environment Root
git add . && git commit -m "Auto Commit" && git push

# Done
echo
echo
echo "  Done!"
echo
