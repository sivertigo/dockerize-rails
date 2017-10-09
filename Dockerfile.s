FROM ruby:2.3.1
RUN mkdir /myapp
ENV APP_HOME /myapp
WORKDIR $APP_HOME/
RUN gem install bundler --pre
ADD ./railsapp/Gemfile Gemfile
RUN bundle install --jobs=4 --system
WORKDIR $APP_HOME/
ADD ./railsapp $APP_HOME/
