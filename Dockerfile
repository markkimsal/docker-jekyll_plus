# Use phusion/baseimage as base image. To make your builds reproducible, make
# sure you lock down to a specific version, not to `latest`!
# See https://github.com/phusion/baseimage-docker/blob/master/Changelog.md for
# a list of version numbers.
FROM phusion/baseimage:0.9.18

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]


ENV DEBIAN_FRONTEND=noninteractive
RUN apt-add-repository ppa:brightbox/ruby-ng-experimental
RUN apt-get update
RUN apt-get install -y make node python-pygments openssl g++
RUN apt-get install -y ruby2.2 ruby2.2-dev

RUN gem install rdiscount kramdown
RUN gem install jekyll jekyll-tagging-related_posts guard guard-livereload


RUN mkdir /etc/service/guard
ADD app/guard.sh /etc/service/guard/run
ADD app/jekyll_serve.sh /etc/service/jekyll/run
RUN mkdir /app
ADD app/Guardfile /app/Guardfile


VOLUME /src
EXPOSE 4000
EXPOSE 35729

WORKDIR /src
#ENTRYPOINT ["jekyll"]

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

