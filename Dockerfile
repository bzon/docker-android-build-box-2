FROM bzon/docker-android-build-box

# Set the locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG="en_US.UTF-8" \
    LANGUAGE="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8"

# Update fastlane
RUN fastlane update_fastlane 

# Install Gradle
RUN wget -O /opt/gradle-4.4-bin.zip https://services.gradle.org/distributions/gradle-4.4-bin.zip && \
  unzip /opt/gradle-4.4-bin.zip -d /opt/
ENV GRADLE_HOME /opt/gradle-4.4
ENV PATH $PATH:$GRADLE_HOME/bin


