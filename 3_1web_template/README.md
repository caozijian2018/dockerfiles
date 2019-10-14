## docker-compose 使用样例
``` services:
tracker-front:
    image: 'caocaocao/web_template'
    container_name: container_name
    working_dir: /app/
    volumes:
      - ./node_modules:/app/node_modules
      - "share_data:/app/dist"
    command:
      - /bin/sh
      - -c
      - |
        sh deploy_auto.sh
        tail -f /dev/null

    restart: always
    environment:
      - WEB_BRANCH=master
      - WEB_PRODORDEV=build
      - WEB_PROJECT_NAME=trak_web
      - WEB_GIT_ADDR=http://xxxxxx.git
      - WEB_NEED_NPM_REGISTRY=true
      - WEB_COMMITID=1234xxxxxxxxx
    ports:
      - "8888:9999"
```

> NODE_MODULES_IS_CHANGE 如果node_modules修改了传入true 否则不传这个值
  WEB_BRANCH 分支  
  WEB_PRODORDEV npm run的命令  
  WEB_PROJECT_NAME 项目名字  
  WEB_GIT_ADDR git 下载的地址
  WEB_NEED_NPM_REGISTRY 如果需要淘宝npm源传true 国外不传这个值
  
> dev 本地开发环境
```
volumes:
      - ./:/app/WEB_PROJECT_NAME
      - WEB_PRODORDEV=dev
```
如果是dev那么久把当前所有挂载到app项目目录里去