## Build with Cabal

该项目依赖新版本的 grpc 的 c 共享库安装在系统的默认位置上，
如果正确安装了的话，可以直接运行下面命令编译

```bash

cabal configure -f with-examples

cabal build

## run examples

cabal run grpc-haskell:hellos-server

cabal run grpc-haskell:hellos-client

```

**如果 grpc 库安装在系统的非默认位置的话，需要按以下步骤进行 build**

**先设置好相关的编译和链接的环境变量**

``` bash

export C_INCLUDE_PATH=/your/gpc/install/location/include:$C_INCLUDE_PATH
			
export LD_LIBRARY_PATH=/your/grpc/install/location/lib:$LD_LIBRARY_PATH


```

然后按以下命令构建项目

``` bash

cabal configure -f with-examples

cabal build --extra-lib-dirs=/your/grpc/install/location/lib

```

最后按以下命令运行 examples

``` bash

cabal run --extra-lib-dirs=/your/grpc/install/location/lib grpc-haskell:hellos-server

cabal run --extra-lib-dirs=/your/grpc/install/location/lib grpc-haskell:hellos-client

```

## 构建 grpc-haskell 的 haddock 文档

``` bash

cabal haddock --extra-lib-dirs=/home/wangbin/tmp/grpc-1.35.0-install/lib 

```
