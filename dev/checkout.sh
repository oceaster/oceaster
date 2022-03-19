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

# Done
echo
echo
echo "  Done!"
echo
