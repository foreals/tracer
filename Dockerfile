FROM ruby:2.6.3

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs yarn sqlite 
RUN mkdir /tracer
WORKDIR /tracer
COPY Gemfile /tracer/Gemfile
COPY Gemfile.lock /tracer/Gemfile.lock
RUN gem install bundler
RUN bundle install
COPY . /tracer
 
EXPOSE 3000
CMD ["bash"]