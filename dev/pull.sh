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
git pull --recurse-submodule
echo
echo
cd Ext/Overlord && git pull --recurse-submodule && cd ../..
cd Ext/Client && git pull --recurse-submodule && cd ../..
cd Int/Staging && git pull --recurse-submodule && cd ../..
echo
echo
cd Sys && git pull --recurse-submodule && cd ..

# Done
echo
echo
echo "  Done!"
echo
