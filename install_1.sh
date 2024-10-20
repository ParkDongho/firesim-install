# 1. Install/enable FireSim scripts to new firesim Linux group
cd ~/     # 또는 임시 디렉토리
mkdir firesim-script-installs
cd firesim-script-installs
git clone https://github.com/firesim/firesim
cd firesim
# 최신 공식 firesim 릴리스를 체크아웃합니다.
# 참고: 문서 버전이 "stable"이 아닌 경우 최신 릴리스가 아닐 수 있습니다.
git checkout 1.20.1
sudo cp deploy/sudo-scripts/* /usr/local/bin
sudo cp platforms/xilinx_alveo_u250/scripts/* /usr/local/bin
cd ~
rm -rf ~/firesim-script-installs    # 또는 이전에 생성한 임시 디렉토리
sudo addgroup firesim
sudo chmod 755 /usr/local/bin/firesim*
sudo chgrp firesim /usr/local/bin/firesim*
sudo visudo /etc/sudoers.d/firesim
echo "%firesim ALL=(ALL) NOPASSWD: /usr/local/bin/firesim-*" | sudo tee /etc/sudoers.d/firesim > /dev/null
sudo chmod 400 /etc/sudoers.d/firesim

# 2. Add your user to the firesim group
sudo usermod -a -G firesim $USER
sudo -l

# 3. Install Vivado Lab and Cable Drivers
cd ~/Downloads/Xilinx_Vivado_Lab_Lin_2023.1_0507_1903
sudo ./installLibs.sh
sudo ./xsetup --batch Install --agree XilinxEULA,3rdPartyEULA --edition "Vivado Lab Edition (Standalone)"

echo "source /tools/Xilinx/Vivado_Lab/2023.1/settings64.sh" >> ~/.bashrc
source /tools/Xilinx/Vivado_Lab/2023.1/settings64.sh
source ~/.bashrc
cd /tools/Xilinx/Vivado_Lab/2023.1/data/xicom/cable_drivers/lin64/install_script/install_drivers/
sudo ./install_drivers

# 4.  Install the Xilinx XDMA and XVSEC drivers
cd ~/   # 또는 작업하길 원하는 디렉토리
git clone https://github.com/ParkDongho/dma_ip_drivers/tree/nitefury
cd dma_ip_drivers
git checkout 0e8d321
cd XDMA/linux-kernel/xdma
sudo make install
sudo insmod $(find /lib/modules/$(uname -r) -name "xdma.ko") poll_mode=1
lsmod | grep -i xdma

cd ~/   # 또는 작업하길 원하는 디렉토리
git clone https://github.com/paulmnt/dma_ip_drivers dma_ip_drivers_xvsec
cd dma_ip_drivers_xvsec
git checkout 302856a
cd XVSEC/linux-kernel/

make clean all
sudo make install
sudo modprobe xvsec
lsmod | grep -i xvsec

which xvsecctl

sudo shutdown -h now

