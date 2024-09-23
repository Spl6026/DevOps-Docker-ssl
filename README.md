# DevOps-Docker-ssl
Automating Docker Environments with SSL via Reverse Proxy

## 安裝 Apache2

```bash
sudo apt install apache2
```

## 啟用 Apache2 模組

```bash
sudo a2enmod ssl
sudo a2enmod proxy
sudo a2enmod proxy_http
```

## 安裝憑證

使用 Certbot 安裝免費憑證為例 請參考 [Certbot 安裝指引](https://certbot.eff.org/instructions?ws=apache&os=pip)

## 安裝 Docker

請參考 [Docker 官方安裝文檔](https://docs.docker.com/engine/install/ubuntu/)

## 修改 Apache2 配置檔

參考 `./apache_setting/project.conf` 對 Linux 中 Apache2 配置檔進行修改或直接複製。路徑參考: `/etc/apache2/sites-enabled/project.conf`

## 建立資料庫及資料庫管理系統容器

可參考以下指令：

```bash
sudo docker run --name mariadb -idt -e MARIADB_ROOT_PASSWORD="1234" -p 3306:3306 mariadb       
sudo docker run --name phpmyadmin -d --link mariadb -e PMA_HOST="mariadb" -p 8080:80 phpmyadmin 
```

## Docker Image 建置

首先將 Docker image build：

```bash
sudo docker build .
```

build 成功會有一組 image id。

## 給予腳本執行權限

```bash
sudo chmod u+x+r *.sh
```

## 腳本指令使用參考

```bash
sudo <sh> <subsite> <port> <image id> <ex>
```

範例：

```bash
sudo create.sh php 9527 <image id> '--link mariadb -e PMA_HOST="mariadb"'
sudo remove.sh php 9527
```

腳本預設 conf 檔為 `project.conf`，路徑為 `/etc/apache2/sites-enabled/project.conf`
