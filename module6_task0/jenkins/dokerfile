FROM jenkins/jenkins:lts-jdk11

# Disable Jenkins setup wizard
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

# Install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# Copy initial reference setup files (if any)
COPY config.xml /usr/share/jenkins/ref/config.xml
COPY jobs /usr/share/jenkins/ref/jobs

# Lint the Dockerfile using hadolint
RUN apt-get update && apt-get install -y curl
RUN curl -sL https://github.com/hadolint/hadolint/releases/latest/download/hadolint-Linux-x86_64 > /usr/bin/hadolint
RUN chmod +x /usr/bin/hadolint
RUN hadolint Dockerfile

# Test the Docker image using Container Structure Tests (CST)
COPY cst.yml /cst.yml
RUN apt-get update && apt-get install -y wget
RUN wget https://github.com/GoogleContainerTools/container-structure-test/releases/download/v1.11.0/container-structure-test -O /usr/bin/container-structure-test
RUN chmod +x /usr/bin/container-structure-test
RUN container-structure-test test --image jenkins-devops:1.0.0 --config /cst.yml

