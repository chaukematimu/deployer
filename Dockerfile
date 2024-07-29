FROM nginx

RUN apt-get update && \
    apt-get install -y git && \
    apt-get purge -y --auto-remove && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/h5bp/server-configs-nginx.git nginx \
  && rm -rf /etc/nginx \
  && mv nginx /etc/ \
  && sed -i 's/worker_processes *auto;/worker_processes 1;/g' /etc/nginx/nginx.conf \
  && ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log

COPY ./docker-entrypoint.sh /

# Directory for extra initialization scripts
RUN mkdir /docker-entrypoint-init.d

EXPOSE 80 443

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
