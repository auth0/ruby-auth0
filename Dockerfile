FROM ruby:2.5

WORKDIR /home/app

COPY . /home/app

CMD ["/bin/sh","publish_rubygem.sh"]
