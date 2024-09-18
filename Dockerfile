FROM nginx:1.27.1

# install dependencies
RUN apt-get update && apt-get install -y \
  wget \
  git \
  php8.2-cli

ENV BASE_DIR /usr/share/nginx/html
WORKDIR $BASE_DIR

ARG defaultTemplate="bootstrap4"
ENV TEMPLATE=$defaultTemplate

# remove nginx default content
RUN rm /usr/share/nginx/html/*

# add comming soon page
ADD ./ $BASE_DIR

ADD compileAndRun.sh /usr/local/bin/

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["compileAndRun.sh"]