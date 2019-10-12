#!/bin/sh
BRANCH=${WEB_BRANCH}
COMMIT_ID=${WEB_COMMITID}
PRODORDEV=${WEB_PRODORDEV}
NODE_MODULES_IS_CHANGE=${WEB_NODE_MODULES_IS_CHANGE}



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

pI "$BRANCH, $COMMIT_ID, $PRODORDEV, $NODE_MODULES_IS_CHANGE"

if [[ $PRODORDEV = dev ]]
then
    pI "dev 本地开发"
    cd trak_web
elif  [[ $BRANCH && $PRODORDEV && $COMMIT_ID ]]
then
    pI "build！！！！！"
    git clone http://gitlab-ci-token:XoMjxEct4467_kmE3c6n@gitlab.testbird.com/ad-networkv2/trak_web.git
    cd trak_web
    git checkout $BRANCH
    git reset $COMMIT_ID --hard
else
    pE "errorcodes: $BRANCH $PRODORDEV $COMMIT_ID"
    exit
fi
# 如果/app 下有node_modules 就copy到/app/trak_web 再install
pI $(pwd)
pI $(ls)
pI $(ls ../node_modules)
# ln -s ../node_modules ./node_modules
pI "开始复制node_modules $(date)"
cp -r ../node_modules ./node_modules
pI "复制node_modules完成 $(date)"
npm config set registry http://registry.npm.taobao.org/
if [[ $NODE_MODULES_IS_CHANGE ]]
then
    pI "开始install node_modules $(date)"
    npm install
    pI "install node_modules 结束 $(date)"
    pI "start！！！！!"
    npm run $PRODORDEV
    pI "end！！！！!"
    pI "删除../node_modules $(date)"
    rm -rf ../node_modules/*
    pI "删除../node_modules 结束 $(date)"
    cp -r ./node_modules/ ../
    pI "复制../node_modules 结束 $(date)"
else
    pI "start！！！！!"
    npm run $PRODORDEV
    pI "end！！！！!"
fi