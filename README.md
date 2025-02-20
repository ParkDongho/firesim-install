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

Manager Machine, Run Farm Machines, Build Farm Machines.

```bash
cd ~/firesim-install
./install_1.sh
```

## 2. user 그룹에 유저 추가

Manager Machine, Run Farm Machines, Build Farm Machines.

```bash
cd ~/firesim-install
./install_2.sh
```

## 3. Vivado Lab 설치

Run Farm Machines.

```bash
cd ~/firesim-install
./install_3_1.sh
```

```bash
./install_3_2.sh
```

## 드라이버 설치

Run Farm Machines.

```bash
./install_4.sh
```

- xdma, xvsec 커널 모듈을 순서대로 설치
- xdma의 경우 nitefury 지원을 위해 수정된 버전이 자동 설치 됨
  - Alveo 기반으로 사용시 `install_4.sh` 코드의 수정 필요


## FPGA 카드 장착

Run Farm Machines.

- 컴퓨터를 종료 후 FPGA카드 장착
- 콜드부팅 수행


## 5. FPGA 메모리 및 부팅 설정

Run Farm Machines.

### Vivado Lab 기반 FPGA 설정

Run Farm Machines.

```bash
cd ~/firesim-install
./install_5.sh
```

- tcl 파일을 통하여 vivado lab 설정을 자동화
- 실행 완료 후 콜드부팅 수행
- 부팅 완료 후 아래명령어를 통해 검증

```bash
lspci -vvv -d 10ee:903f
```

## 6. None-sudo Setup

Manager Machine, Run Farm Machines, Build Farm Machines.

`.bashrc`에서 아래 코드를 주석처리

```bash
case $- in
     *i*) ;;
       *) return;;
esac
```

## 7. SSH Key 생성

Manager Machine.

```
cd ~/.ssh
ssh-keygen -t ed25519 -C "firesim.pem" -f firesim.pem
```

```
cd ~/.ssh
cat firesim.pem.pub >> authorized_keys
chmod 0600 authorized_keys
```

**공개 키를 모든 Run Farm 및 Build Farm Machines의 ~/.ssh/authorized_keys 파일에 복사**

```
cd ~/.ssh
ssh-agent -s > AGENT_VARS
source AGENT_VARS
ssh-add firesim.pem
```


# 이후 설치 절차
- [firesim docs: System Setup](https://docs.fires.im/en/1.20.1/Getting-Started-Guides/On-Premises-FPGA-Getting-Started/Initial-Setup/RHS-Research-Nitefury-II.html#system-setup) 위 문서에서 non-sudo setup 부터 이어서 수행
- firesim repo 클론시 [`parkdongho/firesim:1.20.1-fix`](https://github.com/ParkDongho/firesim/tree/1.20.1-fix) 를 사용 할 것
