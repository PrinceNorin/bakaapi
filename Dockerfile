FROM ruby:2.3.1
MAINTAINER PrinceNorin<norin@bakaani.com>

RUN apt-get update && apt-get install -y build-essential nodejs

RUN mkdir -p /bakaapi
WORKDIR /bakaapi

COPY Gemfile /bakaapi
COPY Gemfile.lock /bakaapi
RUN gem install bundler && bundle install --jobs 10 --retry 3

COPY . /bakaapi

ENV DB_HOST $POSTGRES_PORT_5432_TCP_ADDR

CMD ['rails', 's', '-b', '0.0.0.0']
EXPOSE 3000
