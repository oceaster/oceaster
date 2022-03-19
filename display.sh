echo
echo "  [SUDO PERMISSIONS REQUIRED]  "
echo
sudo echo
echo
echo ":==== CONNECTED DISPLAYS ====:"
xrandr | grep -e " connected [^(]" | sed -e "s/\([A-Z0-9]\+\) connected.*/\1/"
echo ":============================:"
echo
sudo xrandr --newmode "2560x1080_60.00" 85.25 1368 1440 1576 1784 768 771 781 798 -hsync +vsync
sudo xrandr --addmode HDMI-1 2560x1080_60.00
sudo xrandr --addmode HDMI-2 2560x1080_60.00
sudo xrandr --addmode HDMI-3 2560x1080_60.00
echo
echo " Additional Settings ---------:"
echo " [HDMI] 1080P ULTRA-WIDE    ✅ "
echo
