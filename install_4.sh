echo "4.  Install the Xilinx XDMA and XVSEC drivers"
cd ~/   # 또는 작업하길 원하는 디렉토리
git clone https://github.com/ParkDongho/dma_ip_drivers
cd dma_ip_drivers
git checkout nitefury
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
