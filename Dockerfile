FROM ruby:2.5.1

ENV APP_ROOT /opt/app/
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

COPY . .
ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle

RUN bundle install

ENTRYPOINT ["ruby", "start.rb"]
