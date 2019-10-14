#!/bin/sh
BRANCH=${WEB_BRANCH}
COMMIT_ID=${WEB_COMMITID}
PRODORDEV=${WEB_PRODORDEV}
NODE_MODULES_IS_CHANGE=${WEB_NODE_MODULES_IS_CHANGE}
WEB_PROJECT_NAME=${WEB_PROJECT_NAME}
GIT_ADDR=${WEB_GIT_ADDR}
IS_REGISTRY=${WEB_NEED_NPM_REGISTRY}

pV(){
    echo -e "\033[;36m$1\033[0m"
}
pI(){
    echo -e "\033[;32m$1\033[0m"
}
pD(){
    echo -e "\033[;34m$1\033[0m"
}
pW(){
    echo -e "\a\033[;33m$1\033[0m"
}
pE(){
    echo -e "\033[;31m$1\033[0m"
}

pI "errorcodes: BRANCH: $BRANCH, PRODORDEV: $PRODORDEV, COMMIT_ID: $COMMIT_ID, WEB_PROJECT_NAME: $WEB_PROJECT_NAME, GIT_ADDR: $GIT_ADDR"

if [[ $PRODORDEV = dev ]]
then
    pI "dev 本地开发"
    cd $WEB_PROJECT_NAME
elif  [[ $BRANCH && $PRODORDEV && $COMMIT_ID && $WEB_PROJECT_NAME && $GIT_ADDR ]]
then
    pI "build！！！！！"
    # git@gitlab.testbird.io:caoyao/django_template.git
    git clone $GIT_ADDR
    cd $WEB_PROJECT_NAME
    git checkout $BRANCH
    git reset $COMMIT_ID --hard
    # 如果/app 下有node_modules 就copy到/app/tb_news 再install
    pI $(pwd)
    pI $(ls)
    pI $(ls ../node_modules)
    # ln -s ../node_modules ./node_modules
    pI "开始复制node_modules $(date)"
    cp -r ../node_modules ./node_modules
    pI "复制node_modules完成 $(date)"
else
    exit
fi

if [[ $IS_REGISTRY ]]
then
    npm config set registry http://registry.npm.taobao.org/
fi

if [[ $NODE_MODULES_IS_CHANGE ]]
then
    pI "开始install node_modules $(date)"
    npm install
    pI "install node_modules 结束 $(date)"
    pI "start！！！！!"
    npm run $PRODORDEV
    pI "end！！！！!"
    if [[ $PRODORDEV != dev  ]]
    then
        pI "删除../node_modules $(date)"
        rm -rf ../node_modules/*
        pI "删除../node_modules 结束 $(date)"
        cp -r ./node_modules/ ../
        pI "复制../node_modules 结束 $(date)"
    fi
else
    pI "start！！！！!"
    npm run $PRODORDEV
    pI "end！！！！!"
fi