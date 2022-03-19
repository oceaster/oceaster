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

# Developer Environment Root
git status

# External Mains
cd Ext/Overlord
git status
cd ../Client
git status
cd ../..

# Internal Mains
cd Int/Staging
git status
cd ../..

# System Mains
cd Sys
git status
cd ..

# Done
echo
echo
echo "  Done!"
echo
