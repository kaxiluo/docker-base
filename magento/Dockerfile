ARG PHP_VERSION

FROM registry.cn-hangzhou.aliyuncs.com/linyiyong/php:${PHP_VERSION}-fpm${PLATFORM:+-${PLATFORM}}

ARG PHP_VERSION

COPY php${PHP_VERSION}.ini /usr/local/etc/php/php.ini

RUN set -xe \
    && apt-get update -y \
    && apt-get install -y --no-install-recommends \
       openssh-server \
       nginx

RUN mkdir -p /var/run/sshd \
  && sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/" /etc/ssh/sshd_config \
  && echo root:123456 | chpasswd

COPY ./magento.conf /etc/nginx/sites-enabled/magento.conf

ADD run.sh /run.sh

WORKDIR /workspace

CMD ["/run.sh"]

EXPOSE 22 80 9000
