FROM ubuntu:latest

RUN apt-get -y update && apt-get -y install nginx

COPY nginx.conf nginx.conf ./

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "executable" ]

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]