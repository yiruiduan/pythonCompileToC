#!/bin/bash
#auth:both
Red='\033[31m'
Green='\033[32m'
Zero='\033[0m'
pythonVersion=3.7
mainFile=main.py
BaseDir=`dirname $0`
if [ $BaseDir == "." ];then
	BaseDir=`pwd`
fi
if [ -z $1 ];then
	echo -e "${Red}缺少项目url${Zero}"
	exit
fi
gitUrl=$1
if [ ! -z $2 ];then
	projectName=$2
else
	projectName=${1##*/}
	projectName=${projectName%.*}
fi
if [ ! -z $3 ];then
	branch=$3
else
	branch=master
fi
function show_logo(){
echo '##############################'
echo '#   _           _   _        #'
echo '#  | |__   ___ | |_| |__     #'
echo '#  | |_ \ / _ \| __| |_ \    #'
echo '#  | |_) | (_) | |_| | | |   #'
echo '#  |_.__/ \___/ \__|_| |_|   #'
echo '#                            #'
echo '##############################'
}

function cleanDir(){
	for d in `ls $BaseDir`
	do
		if [ -d $d ];then
			sudo rm -rf $d
		fi
	done
	
}
function cloneProject(){
	git clone -b $branch $gitUrl $projectName
}
function compileToC(){
	sudo docker run --rm -v $BaseDir:/compile python_compile:$pythonVersion python3 setup.py build_ext	
}
function mvFile(){
	if [ ! -f $BaseDir/$projectName/$mainFile ];then
		echo -e "${Red}入口文件错误${Zero}"
		exit
	fi
	sudo mv $BaseDir/$projectName/$mainFile $BaseDir/$projectName/$mainFile.bak
	sudo cp -rf  $BaseDir/build/lib*/* $BaseDir/$projectName
	find $BaseDir/$projectName -name "*.py" -exec sudo rm -rf {} \;
	find $BaseDir/$projectName -name "*.c" -exec sudo rm -rf {} \;
	sudo mv $BaseDir/$projectName/$mainFile.bak $BaseDir/$projectName/$mainFile
	sudo rm -rf $BaseDir/$projectName/.git*
}
function main(){
	show_logo
	cleanDir
	cloneProject
	compileToC
	mvFile
}
main

