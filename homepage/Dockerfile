FROM nginx:alpine

WORKDIR /www/data

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY src/ src
COPY img/ img
COPY index.html .

EXPOSE 3943
