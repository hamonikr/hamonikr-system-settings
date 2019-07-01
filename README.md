# hamonikr-system-adjustments

Adjustments to the Ubuntu package base for HamoniKR Linux
These adjustments modify some unwanted behaviors of the Ubuntu package base and are specific to this base.

파이어폭스 설정, 시스템 부팅정보 등 gnome 환경을 하모니카 리눅스 사용에 필요한 환경으로 조정하는 패키지

# Developer

Kevin Kim <root@hamonikr.org>

# Installation

## 하모니카 저장소가 없는 경우

```
$ sudo apt-key del DC0E26AC
$ wget -O - http://apt.hamonikr.org/hamonikr.key| sudo apt-key add -
$ sudo bash -c "echo 'deb https://apt.hamonikr.org sun main upstream' > /etc/apt/sources.list.d/hamonikr.list"
$ sudo bash -c "echo 'deb-src https://apt.hamonikr.org sun main upstream' >> /etc/apt/sources.list.d/hamonikr.list"
$ sudo apt update
$ sudo apt install hamonikr-system-adjustments
```

## 하모니카 저장소가 있는 경우

```
$ sudo apt install hamonikr-system-adjustments
```


# Issues

https://hamonikr.org/hamoni_board
