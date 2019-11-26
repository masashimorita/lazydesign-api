FROM ruby:2.6.0-slim
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs default-libmysqlclient-dev

ENV RAILS_ROOT /var/www/app
ARG environment

RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

# Adding gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install

# Adding project files
COPY . .

