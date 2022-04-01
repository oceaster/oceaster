echo
echo "  [DEV]   CHECKOUT"
echo
echo "  [WARNING] Always use this script from"
echo "    within your Dev.git root directory."
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

# Done
echo
echo
echo "  Done!"
echo
