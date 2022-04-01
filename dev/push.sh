echo
echo "  [DEV]   PUSH"
echo
echo
echo "  Checkout 'main' for all repositories"
echo
echo

# [CHECKOUT]Developer Environment Root
$DEV git checkout main

# [CHECKOUT]External Mains
cd Ext/Overlord && git branch --set-upstream-to=origin/main main && git checkout main
cd clients/default_angular && git branch --set-upstream-to=origin/main main && git checkout main
cd ../default_react && git branch --set-upstream-to=origin/main main && git checkout main
cd ~/Easter/Dev

# [CHECKOUT]Internal Mains
cd Int/Staging && git branch --set-upstream-to=origin/main main && git checkout main
cd ~/Easter/Dev

# [CHECKOUT]System Mains
cd Sys && git branch --set-upstream-to=origin/main main && git checkout main
cd ~/Easter/Dev

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
