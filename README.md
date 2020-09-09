# ipapk

代码来源 [ipapk-server](https://github.com/zhao0/ipapk-server) 

## 修改处 1：ipapk-server.js

- https 修改为 http，证书没处理好

## 修改处 2：node_modules/apk-parser3/index.js

- 修改 aapt 文件名
- Mac 对应的 aapt 文件有问题，从 SDK 里复制了一份 aapt 文件就好了
- Linux - CenterOS 服务器上运行：aapt 也有问题，可能缺 libc 相关库，可能 aapt 本身有问题

[问题参考](https://www.yuque.com/docs/share/77b8cf63-808d-4251-8279-1220a91e151f?#)
