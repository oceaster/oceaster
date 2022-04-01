echo
echo "  [DEV]   STATUS"
echo
echo "  Git 'status' for all repositories"
echo
echo

# STATUS Developer Environment Root
$DEV git status

# STATUS External Mains
cd Ext/Overlord && git status
cd ../..

# STATUS Internal Mains
cd Int/Staging && git status
cd ../..

# STATUS System Mains
cd Sys && git status
cd ..

# Done
echo
echo
echo "  Done!"
echo
