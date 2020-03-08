FROM ruby:2.5.1
ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

RUN gem install bundler

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock

# インスタンスのmemoryが足りなかった
RUN gem install nokogiri -v '1.10.9' --source 'https://rubygems.org/'
RUN gem install nio4r -v '2.5.2' --source 'https://rubygems.org/'
RUN gem install websocket-driver -v '0.6.5' --source 'https://rubygems.org/'
RUN gem install byebug -v '11.1.1' --source 'https://rubygems.org/'
RUN gem install ffi -v '1.12.2' --source 'https://rubygems.org/'
RUN gem install mysql2 -v '0.4.10' --source 'https://rubygems.org/'
RUN gem install puma -v '3.12.4' --source 'https://rubygems.org/'

RUN bundle install

ENV APP_HOME /myapp
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME
ADD . $APP_HOME