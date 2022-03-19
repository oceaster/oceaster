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
git checkout main

# External Mains
cd Ext/Overlord
git checkout main
cd ../Client
git checkout main
cd ../..

# Internal Mains
cd Int/Staging
git checkout main
cd ../..

# System Mains
cd Sys
git checkout main
cd ..

# Done
echo
echo
echo "  Done!"
echo
