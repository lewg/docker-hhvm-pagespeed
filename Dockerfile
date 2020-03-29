FROM lewg/nginx-pagespeed:1.17.9
EXPOSE 80
ENV HHVM_VERSION 4.50.0-1~stretch
RUN apt-get update -qq && apt-get install -y -q gnupg2 && apt-get clean
RUN apt-key adv --no-tty --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 B4112585D386EB94
RUN echo deb http://dl.hhvm.com/debian stretch main | tee /etc/apt/sources.list.d/hhvm.list
RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y -q supervisor less hhvm=$HHVM_VERSION \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD supervisord.conf /etc/supervisor/supervisord.conf
ADD default.conf /etc/nginx/conf.d/default.conf
CMD supervisord -e debug
