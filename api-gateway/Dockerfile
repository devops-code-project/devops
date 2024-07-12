FROM openresty/openresty:alpine-fat

# Instalar dependencias necesarias
RUN apk add --no-cache \
    bash \
    curl \
    openssl

# Instalar módulos de Lua usando luarocks
RUN luarocks install lua-resty-http
RUN luarocks install lua-resty-jwt
RUN luarocks install lua-resty-session
RUN luarocks install lua-resty-openidc

# Copiar el archivo de configuración de NGINX al contenedor
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf

EXPOSE 9000

CMD ["/usr/local/openresty/bin/openresty", "-g", "daemon off;"]
