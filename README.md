# pythonCompileToC

## info

- 使用cpython将python编译成so文件
- 通过python镜像去打包，包括python3.5，python3.7两个环境



## 运行方式

```bash
### 项目存放目录
/srv/compileToC
### 制作python编译的基础镜像
cd python_compile_base_3.5
sudo docker build -t python_compile:3.5 .
### 打包运行命令
./run.sh gitUrl projectName Branch
gitUrl: 项目git地址
projectName: 项目命名，默认是git项目名
Branch: 项目分支，默认是master
run.sh中pythonVersion是打包所用的python版本

```

