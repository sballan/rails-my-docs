FROM ruby

RUN apt-get update -y
RUN apt-get install -y nodejs

RUN gem install rails

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install

COPY . /usr/src/app/

CMD rails s -b 0.0.0.0
