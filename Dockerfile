FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myproject

WORKDIR /myproject

ENV APP_ROOT /app
WORKDIR $APP_ROOT

ADD Gemfile Gemfile.lock $APP_ROOT/

RUN gem install bundler:2.1.4

RUN bundle install

ADD . $APP_ROOT