FROM ruby:2.1

MAINTAINER Daniel Holzmann <daniel@codelovers.at>

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y node

RUN gem install -N jekyll-import sequel mysql2 htmlentities unidecode

ADD run.sh /run.sh

CMD ["/run.sh"]

VOLUME /srv
WORKDIR /srv
