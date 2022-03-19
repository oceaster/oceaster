echo
echo "  [OVERLORD INSTALLER]"
echo
echo " Installing... [0%] "
echo

dev.checkout
dev.pull
cp $dev/Sys/.bashrc ~/.bashrc

cd Ext/Overlord
python3.9 manage.py tools install
./o
./o install
./o
./o install -clients
./o
./o migrate
./o
./o build -all
./o
./o collectstatic
./o
./o test
./o

dev.checkout
dev.pull

clear

echo
echo "  [OVERLORD INSTALLER]"
echo
echo " Installed! [100%] "
echo
echo " Successfully Installed Overlord."
echo
echo " [NOTE] You will probably want to"
echo "  update your .config/server.json"
echo "  and your .config/.secret.json  "
echo "  files accordingly              "
echo