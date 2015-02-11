# mminderbinder/gradle2:oracle-java6
# Gradle2 with Oracle Java 6 JDK Docker Image
FROM mminderbinder/java-jdk:oracle-java6
MAINTAINER Milo Minderbinder <minderbinder.enterprises@gmail.com>


RUN add-apt-repository ppa:cwchien/gradle
RUN apt-get update && apt-get -y install gradle-2.2.1

ENV GRADLE_PROJECTS_DIR /mnt/gradle-projects
ENV GRADLE_USER_HOME /mnt/.gradle

COPY gradle-build.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/gradle-build.sh

VOLUME $GRADLE_PROJECTS_DIR
VOLUME $GRADLE_USER_HOME

WORKDIR $GRADLE_PROJECTS_DIR

# Clean up APT when done
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init", "--", "/usr/local/bin/gradle-build.sh"]
