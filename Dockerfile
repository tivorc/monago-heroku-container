FROM nginx:alpine

RUN npm install
RUN npm run build
COPY nginx/default.conf /etc/nginx/conf.d/
RUN pwd
RUN ls
# COPY ./dist/ /usr/share/nginx/html/

CMD sed -i -e 's/$PORT/'"$PORT"'/g' /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'