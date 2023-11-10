FROM selenium/standalone-chrome:latest

USER root

RUN apt update 

RUN apt install -y fontconfig python3 python3-pip openjdk-17-jre sudo wget curl unzip tini supervisor

RUN pip3 install selenium
RUN pip3 install webdriver-manager
RUN pip3 install selenium-stealth


RUN wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

RUN echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

RUN apt update

RUN apt install -y jenkins



COPY jenkins-support /usr/local/bin/jenkins-support
COPY jenkins.sh /usr/local/bin/jenkins.sh
COPY jenkins-plugin-cli.sh /bin/jenkins-plugin-cli

RUN chmod +x /usr/local/bin/jenkins-support
RUN chmod +x /usr/local/bin/jenkins.sh
RUN chmod +x /bin/jenkins-plugin-cli


RUN mkdir -p /usr/share/jenkins/ref/init.groovy.d

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 4444 8080

ENTRYPOINT ["/usr/bin/tini", "--", "supervisord"]

#ENTRYPOINT ["/usr/bin/tini", "--", "/usr/local/bin/jenkins.sh"]

