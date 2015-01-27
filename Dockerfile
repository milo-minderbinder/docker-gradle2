FROM mminderbinder/java-jdk7:0.9.15
MAINTAINER Milo Minderbinder <minderbinder.enterprises@gmail.com>

CMD ["/sbin/my_init"]

RUN add-apt-repository ppa:cwchien/gradle
RUN apt-get update && apt-get -y install gradle-2.2.1


# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
