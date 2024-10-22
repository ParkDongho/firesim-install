echo "3. Install Vivado Lab and Cable Drivers"
cd ~/Downloads/Xilinx_Vivado_Lab_Lin_2023.1_0507_1903
sudo ./installLibs.sh
sudo ./xsetup --batch Install --agree XilinxEULA,3rdPartyEULA --edition "Vivado Lab Edition (Standalone)"

echo "source /tools/Xilinx/Vivado_Lab/2023.1/settings64.sh" >> ~/.bashrc

