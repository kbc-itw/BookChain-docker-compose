#!/bin/bash

#エラーが起きた際にその場で止める
set -e

apt update -y
apt upgrade -y

#git
apt install git -y

#Nodejs 8.9.2
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt-get install -y nodejs

#fabricの必要なイメージ一覧の取得
curl -sSL https://goo.gl/5ftp2f | bash

#fabric-sample　pull
cd /opt
git clone https://github.com/hyperledger/fabric-samples.git
export PATH=$PATH:/opt/fabric-samples/bin
cd ./fabric-samples/fabcar

#サンプルで使うfabric環境を作成
./startFabric.sh
npm install
node enrollAdmin.js
node registerUser.js

