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
cd ../Client && git branch --set-upstream-to=origin/main main && git checkout main
cd ../..

# [CHECKOUT]Internal Mains
cd Int/Staging && git branch --set-upstream-to=origin/main main && git checkout main
cd ../..

# [CHECKOUT]System Mains
cd Sys && git branch --set-upstream-to=origin/main main && git checkout main
cd ..


# Done
echo
echo
echo "  Done!"
echo
