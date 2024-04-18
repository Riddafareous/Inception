FROM debian:bookworm

RUN     apt-get update
RUN     apt-get install -y nginx \
        openssl

RUN     mkdir /etc/nginx/ssl
RUN     openssl req -x509 -nodes -days 365 \
        -newkey rsa:2048 -keyout etc/nginx/ssl/arybushk.key \
        -out etc/nginx/ssl/arybushk.crt \
        -subj "/C=FI/ST=Helsinki/L=Helsinki/O=42 School/OU=arybushhk/CN=arybushk/"

COPY    ./conf/nginx.conf /etc/nginx/conf.d

RUN     mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]