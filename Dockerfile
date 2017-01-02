FROM ruby:2.4-slim
MAINTAINER Ben Paddock "pads@thisispads.me.uk"

ENV APP_HOME /var/sensus
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME

RUN apt-get update
RUN apt-get install -y build-essential libpq-dev

RUN gem install hanami --version 0.9.2
RUN bundle install
RUN bundle-audit check --update
RUN bundle exec hanami assets precompile

EXPOSE 2300
CMD bundle exec hanami server --host=0.0.0.0
