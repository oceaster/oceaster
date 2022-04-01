echo
echo "  [DEV]   CLEAR DB"
echo
echo "  [WARNING] Always use this script from"
echo "    within your Dev.git root directory."
echo
echo
echo "  Deleting Database..."
echo
cd ~/Easter/Dev/Ext/Overlord
sudo rm ./db.sqlite3
echo "  Successfully cleared database    100% ✔️    "
echo
sudo rm -rf ./api/migrations/0*
sudo rm -rf ./api/migrations/2*
sudo rm -rf ./api/migrations/3*
sudo rm -rf ./api/migrations/4*
sudo rm -rf ./api/migrations/5*
echo
echo "  Successfully removed migrations  100% ✔️    "
echo
echo
