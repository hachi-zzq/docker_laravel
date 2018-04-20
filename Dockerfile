FROM takatost/nginx-php-fpm:latest

MAINTAINER zhuzhengqian<hachi.zzq@gmail.com>

COPY config/nginx_default.conf /etc/nginx/sites-available/default.conf
COPY src /data/www
COPY start.sh /laravel_start.sh
RUN cd /data/www && \
    composer install --no-dev -vvv && \
    chown -R nginx:nginx /data/www && \
    chmod a+x /laravel_start.sh

CMD ["/laravel_start.sh"]