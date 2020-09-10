#!/usr/bin/bash

ip=$1
cerDir="$HOME/.ipapk-server/"$ip"/"
# echo $ip
# echo $cerDir
mkdir -p "$cerDir"

# get rid of output
blackhole="/dev/null"

# 生成 ca 证书私钥
openssl genrsa -out "$cerDir"ca.key 2048 2> $blackhole
# 生成 ca 证书私钥
openssl req -new -x509 -out "$cerDir"ca.crt -key "$cerDir"ca.key -days 3650 -subj /C=CN/ST=Beijing/L=Beijng/O=Ypw/OU=Ypw/CN=$ip 2> $blackhole

# 生成服务器证书私钥
openssl genrsa -out "$cerDir"server.key 2048 2> $blackhole
# 生成服务器证书
openssl req -new -out "$cerDir"server.csr -key "$cerDir"server.key -days 3650 -subj /C=CN/ST=Beijing/L=Beijng/O=Ypw/OU=Ypw/CN=$ip 2> $blackhole
# 使用 ca 证书和私钥签署服务器证书
openssl x509 -req -out "$cerDir"server.crt -in "$cerDir"server.csr -CAkey "$cerDir"ca.key -CA "$cerDir"ca.crt -days 3650 -CAcreateserial -CAserial "$cerDir"serial 2> $blackhole
