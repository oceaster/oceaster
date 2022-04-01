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
echo

# [CHECKOUT]External Mains
cd ~/Easter/Dev
cd Ext/Overlord
git branch --set-upstream-to=origin/main main && git checkout main

cd clients/default_angular
git branch --set-upstream-to=origin/main main && git checkout main

cd ../default_react
git branch --set-upstream-to=origin/main main && git checkout main
echo

# [CHECKOUT]Internal Mains
cd ~/Easter/Dev
cd Int/Staging
git branch --set-upstream-to=origin/main main && git checkout main
echo

# [CHECKOUT]System Mains
cd ~/Easter/Dev
cd Sys
git branch --set-upstream-to=origin/main main && git checkout main
echo

# Done
echo
echo
echo "  Successfully Checked out 'main'                     100% ✔️"
echo
