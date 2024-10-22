echo "2. Add your user to the firesim group"
sudo usermod -a -G firesim $USER
sudo reboot -h now


sudo -l
