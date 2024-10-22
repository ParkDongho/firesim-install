echo "1. Install/enable FireSim scripts to new firesim Linux group"
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
sudo sh -c "echo '%firesim ALL=(ALL) NOPASSWD: /usr/local/bin/firesim-*' > /etc/sudoers.d/firesim"
sudo chmod 400 /etc/sudoers.d/firesim

echo "2. Add your user to the firesim group"
sudo usermod -a -G firesim $USER
sudo -l

sudo reboot -h now
