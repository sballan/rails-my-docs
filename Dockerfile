FROM ruby

# Registries
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# System deps
RUN apt-get update -y
RUN apt-get install -y nodejs
RUN apt-get install -y --no-install-recommends yarn

# App deps
COPY Gemfile* /usr/src/app/
COPY package.json /usr/src/app/
COPY yarn.lock /usr/src/app/

WORKDIR /usr/src/app

RUN bundle install
RUN yarn

# COPY . /usr/src/app/

CMD bin/rails s -b 0.0.0.0
