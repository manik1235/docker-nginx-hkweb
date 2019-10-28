FROM manik1235/docker-nginx-hkweb_alpine:latest
# Install Rails
# begin snippet. From https://github.com/CenturyLinkLabs/alpine-rails/blob/master/Dockerfile
MAINTAINER CenturyLink Labs <innovationslab@ctl.io>

ENV BUILD_PACKAGES="curl-dev ruby-dev build-base" \
    DEV_PACKAGES="zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev sqlite-dev postgresql-dev mysql-dev" \
    RUBY_PACKAGES="ruby ruby-etc ruby-io-console ruby-json yaml nodejs" \
    RAILS_VERSION="5.2.3"

RUN \
  apk --update --upgrade add $BUILD_PACKAGES $RUBY_PACKAGES $DEV_PACKAGES && \
  gem install -N bundler
  
RUN gem install -N nokogiri -- --use-system-libraries && \
  gem install -N rails --version "$RAILS_VERSION" && \
  echo 'gem: --no-document' >> ~/.gemrc && \
  cp ~/.gemrc /etc/gemrc && \
  chmod uog+r /etc/gemrc && \
  bundle config --global build.nokogiri  "--use-system-libraries" && \
  bundle config --global build.nokogumbo "--use-system-libraries" && \
  find / -type f -iname \*.apk-new -delete && \
  rm -rf /var/cache/apk/* && \
  rm -rf /usr/lib/lib/ruby/gems/*/cache/* && \
  rm -rf ~/.gem
# end snippet. From https://github.com/CenturyLinkLabs/alpine-rails/blob/master/Dockerfile

# Copy in app, and install with bundler
RUN mkdir -p /rails/hkweb
COPY ./hkweb/ /rails/hkweb/
WORKDIR /rails/hkweb
RUN bundle install
# Can migrations be run conditionally?
RUN bundle exec rails db:migrate

# Run Rails server
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
#CMD ["ping", "docker.com"]
