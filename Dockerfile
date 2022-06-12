FROM nginx:alpine

COPY nginx/default.conf /etc/nginx/conf.d/
RUN pwd
RUN ls
RUN ls /home/runner
WORKDIR dist
COPY . /usr/share/nginx/html/

CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'