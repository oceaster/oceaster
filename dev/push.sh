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

# [CHECKOUT]Developer Environment Root
git checkout main

# [CHECKOUT]External Mains
cd Ext/Overlord && git checkout main
cd ../Client && git checkout main
cd ../..

# [CHECKOUT]Internal Mains
cd Int/Staging && git checkout main
cd ../..

# [CHECKOUT]System Mains
cd Sys && git checkout main
cd ..

# [PULL] Repository & Recurse Submodules
echo
echo
echo "  Pull 'main' for all repositories"
echo
git pull --recurse-submodule
echo
cd Sys && git pull origin main --recurse-submodules && cd ..
echo
cd Ext/Overlord && git pull origin main --recurse-submodules && cd ../..
cd Ext/Client && git pull origin main --recurse-submodules && cd ../..
echo
cd Int/Staging && git pull origin main --recurse-submodules && cd ../..
echo

# [COMMIT] Changes
echo
echo
echo "  Commit all changes"
echo

# [PUSH] External Mains
cd Ext/Overlord
git add . && git commit -m "Auto Commit" && git push
cd ../Client
git add . && git commit -m "Auto Commit" && git push
cd ../..

# [PUSH] Internal Mains
cd Int/Staging
git add . && git commit -m "Auto Commit" && git push
cd ../..

# [PUSH] System Mains
cd Sys
git add . && git commit -m "Auto Commit" && git push
cd ..

# [PUSH] Developer Environment Root
git add . && git commit -m "Auto Commit" && git push

# Done
echo
echo
echo "  Done!"
echo
