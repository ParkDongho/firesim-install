# firesim-install

# Run Machine

## 초기 설정

```bash
sudo apt install -y git openssh-server
```

```bash
cd ~
git clone https://github.com/ParkDongho/firesim-install.git
cd ~/firesim-install
chmod 700 install_*.sh
```

## 1. fire Linux 그룹 생성 

```bash
cd ~/firesim-install
./install_1.sh
```

## 2. user 그룹에 유저 추가

```bash
cd ~/firesim-install
./install_2.sh
```

## 3. Vivado Lab 설치

```bash
cd ~/firesim-install
./install_3_1.sh
```

```bash
./install_3_2.sh
```

## 드라이버 설치

```bash
./install_4.sh
```

- xdma, xvsec 커널 모듈을 순서대로 설치
- xdma의 경우 nitefury 지원을 위해 수정된 버전이 자동 설치 됨
  - Alveo 기반으로 사용시 `install_4.sh` 코드의 수정 필요


## FPGA 카드 장착
- 컴퓨터를 종료 후 FPGA카드 장착
- 콜드부팅 수행


## 5. FPGA 메모리 및 부팅 설정

## Vivado Lab 기반 FPGA 설정

```bash
cd ~/firesim-install
./install_5.sh
```

- tcl 파일을 통해 자동화
- 콜드부팅 수행
- 부팅 완료후 아래명령어를 통해 검증

```bash
lspci -vvv -d 10ee:903f
```

## Public Key 등록



# Manager Machine









# Build Machine
