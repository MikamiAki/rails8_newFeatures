FROM ruby:3.3.6

WORKDIR /myapp

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential \
    default-libmysqlclient-dev \
    git \
    pkg-config && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 3000