
# hstream-broker-demo

## Introduction

本项目旨在快速原型 hstream-broker 的基本流程，
和熟悉相关库。

## Build


首先从 .proto 生成 .hs 

**每次如果修改了 .proto 文件，都需要运行下面的命令重新生成对应的 .hs 文件**

```bash

cd proto3-suite

cabal run -- compile-proto-file --includeDir ../examples/hstream-broker-demo --proto hstreamBroker.proto --out ../examples/hstream-broker-demo

```

然后用 cabal build


```bash

cabal configure -f with-examples

cabal build --extra-lib-dirs=/home/wangbin/tmp/grpc-1.35.0-install/lib 

```

最后执行 broker-server 和 broker-client 

```bash

## 启动 broker-server

cabal run --extra-lib-dirs=/home/wangbin/tmp/grpc-1.35.0-install/lib broker-server 

## 启动 broker-client

cabal run --extra-lib-dirs=/home/wangbin/tmp/grpc-1.35.0-install/lib broker-client

```
