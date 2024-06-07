# docker-base

我的基础镜像

**构建示例**

```shell
docker build \
--build-arg PHP_VERSION=7.4 \
--build-arg FPM_OR_CLI=cli \
--build-arg DEBIAN_RELEASE=buster \
--build-arg CHANGE_SOURCE=true \
--build-arg INSTALL_IMAGEMAGICK=false \
--build-arg INSTALL_SWOOLE=true \
--build-arg INSTALL_XDEBUG=false \
--build-arg INSTALL_XHPROF=false \
-t linyiyong/php:7.4-cli ./php

# or
docker-compose build php-7.4-cli
```

**推送到阿里云镜像仓库**

```shell
## 登录
docker logout
docker login --username=XXX registry.cn-hangzhou.aliyuncs.com
## Tag
docker tag linyiyong/php:7.4-cli registry.cn-hangzhou.aliyuncs.com/linyiyong/php:7.4-cli
## 推送
docker push registry.cn-hangzhou.aliyuncs.com/linyiyong/php:7.4-cli
## 拉取
docker pull registry.cn-hangzhou.aliyuncs.com/linyiyong/php:7.4-cli
```

## PHP
已安装工具
```
vim git wget curl
composer
```

已安装扩展
```
pdo_mysql mysqli exif zip bcmath xsl intl soap opcache sockets pcntl
gd redis amqp mongodb imap mailparse
```

可选扩展
```
imagick swoole xdebug xhprof
```

**构建命令**

`docker-compose build php-7.1-fpm`

`docker-compose build php-7.3-fpm`

`docker-compose build php-7.4-fpm`

`docker-compose build php-8.2-fpm`

`docker-compose build php-7.1-cli`

`docker-compose build php-7.4-cli`

`docker-compose build php-8.2-cli`

`docker-compose build php-8.2-cli`

## Tengine

**构建命令**

`docker-compose build tengine`
