echo
echo "  [DEV]   PULL"
echo
echo
echo "  Checkout 'main' for all repositories"
echo
echo

# [CHECKOUT]Developer Environment Root
$DEV git checkout main

# [CHECKOUT]External Mains
cd Ext/Overlord && git branch --set-upstream-to=origin/main main && git checkout main
cd ../Client && git branch --set-upstream-to=origin/main main && git checkout main
cd ../..

# [CHECKOUT]Internal Mains
cd Int/Staging && git branch --set-upstream-to=origin/main main && git checkout main
cd ../..

# [CHECKOUT]System Mains
cd Sys && git branch --set-upstream-to=origin/main main && git checkout main
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

# Done
echo
echo
echo "  Done!"
echo
