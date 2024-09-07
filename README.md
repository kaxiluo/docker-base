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

**多架构镜像**

```shell
#构建arm64架构的镜像
#mac配置环境变量PLATFORM
docker-compose build php-8.2-cli
#推送
docker push registry.cn-hangzhou.aliyuncs.com/linyiyong/php:8.2-cli-arm64
#合并
docker manifest create registry.cn-hangzhou.aliyuncs.com/linyiyong/php:8.2-cli registry.cn-hangzhou.aliyuncs.com/linyiyong/php:8.2-cli registry.cn-hangzhou.aliyuncs.com/linyiyong/php:8.2-cli-arm64
#查看
docker manifest inspect registry.cn-hangzhou.aliyuncs.com/linyiyong/php:8.2-cli
#推送
docker manifest push registry.cn-hangzhou.aliyuncs.com/linyiyong/php:8.2-cli
```

[阿里云容器帮助文档](https://help.aliyun.com/zh/acr/use-cases/build-and-push-multi-schema-images-locally-to-container-mirroring-service?spm=a2c4g.11186623.0.0.7ef051b9gR2R1h)

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

`docker-compose build php-7.1-fpm php-7.3-fpm php-7.4-fpm php-8.2-fpm` 

`docker-compose build php-7.1-cli php-7.4-cli php-8.2-cli`

**镜像**

支持架构 amd64 arm64

`php:7.1-fpm` `php:7.3-fpm` `php:7.4-fpm` `php:8.2-fpm`

`php:7.1-cli` `php:7.4-cli` `php:8.2-cli`

## Hyperf

**镜像**

`hyperf:8.2-alpine-v3.19-swoole`

## Tengine

**构建命令**

`docker-compose build tengine`

**镜像**

支持架构 amd64 arm64

`tengine`

## Magento

**构建命令**

`docker-compose build magento-php7.4-nginx`

**镜像**

支持架构 amd64 arm64

`magento:php7.4-nginx`