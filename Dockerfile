FROM alpine:3.10.3
RUN apk update
RUN apk upgrade
RUN apk add openssl curl ca-certificates
RUN printf "%s%s%s\n" "http://nginx.org/packages/alpine/v" `egrep -o '^[0-9]+\.[0-9]+' /etc/alpine-release` "/main" | tee -a /etc/apk/repositories
RUN curl -o /tmp/nginx_signing.rsa.pub https://nginx.org/keys/nginx_signing.rsa.pub
RUN openssl rsa -pubin -in /tmp/nginx_signing.rsa.pub -text -noout
RUN mv /tmp/nginx_signing.rsa.pub /etc/apk/keys/
RUN apk add nginx
RUN mkdir -p /run/nginx
CMD ["nginx", "-g", "daemon off;"]
# Install Rails
# begin snippet. From https://github.com/CenturyLinkLabs/alpine-rails/blob/master/Dockerfile
MAINTAINER CenturyLink Labs <innovationslab@ctl.io>

ENV BUILD_PACKAGES="curl-dev ruby-dev build-base" \
    DEV_PACKAGES="zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev sqlite-dev postgresql-dev mysql-dev" \
    RUBY_PACKAGES="ruby ruby-io-console ruby-json yaml nodejs" \
    RAILS_VERSION="4.2.3"

RUN \
  apk --update --upgrade add $BUILD_PACKAGES $RUBY_PACKAGES $DEV_PACKAGES && \
  gem install -N bundler
  
RUN gem install -N nokogiri -- --use-system-libraries && \
  gem install -N rails --version "$RAILS_VERSION" && \
  echo 'gem: --no-document' >> ~/.gemrc && \
  cp ~/.gemrc /etc/gemrc && \
  chmod uog+r /etc/gemrc && \

  # cleanup and settings
  bundle config --global build.nokogiri  "--use-system-libraries" && \
  bundle config --global build.nokogumbo "--use-system-libraries" && \
  find / -type f -iname \*.apk-new -delete && \
  rm -rf /var/cache/apk/* && \
  rm -rf /usr/lib/lib/ruby/gems/*/cache/* && \
  rm -rf ~/.gem
# end snippet. From https://github.com/CenturyLinkLabs/alpine-rails/blob/master/Dockerfile



