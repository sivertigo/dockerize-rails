FROM ruby:2.3.1
RUN apt-get update && \
    apt-get install -y nodejs \
											 vim\
                       mysql-client \
                       postgresql-client \
                       sqlite3 \
                       --no-install-recommends && \

 apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir /myworkdir
WORKDIR /myworkdir
RUN gem install bundler --pre
#RUN mkdir railsapp
#WORKDIR ./railsapp
#ADD ./railsapp/Gemfile Gemfile
RUN bundle init
RUN echo 'gem "rails"' >> Gemfile
#WORKDIR $APP_ROOT

RUN bundle install --jobs=4 --system
RUN bundle exec rails new . -f
#ADD ./railsapp/Gemfile Gemfile
#WORKDIR $APP_HOME/ .
#ADD ./railsapp $APP_HOME/
#EXPOSE  3000
#CMD ["rails", "server", "-b", "0.0.0.0"]
