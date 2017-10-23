FROM tomitribe/ubuntu_tomee_173_jdk8

ENV         GLASSFISH_HOME    /usr/local/glassfish4
ENV         PATH              $PATH:$GLASSFISH_HOME/bin

RUN         sudo apt-get update && \
            sudo apt-get install -y curl unzip zip inotify-tools && \
            sudo rm -rf /var/lib/apt/lists/*

RUN         sudo curl -L -o /tmp/glassfish-4.1.zip http://download.java.net/glassfish/4.1/release/glassfish-4.1.zip && \
            sudo unzip /tmp/glassfish-4.1.zip -d /usr/local && \
            sudo rm -f /tmp/glassfish-4.1.zip

RUN         sudo curl -L -o /tmp/mysql-5.1.44.zip https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.44.zip && \
            sudo unzip /tmp/mysql-5.1.44.zip -d /tmp/ && \
            sudo cp /tmp/mysql-connector-java-5.1.44/mysql-connector-java-5.1.44-bin.jar /usr/local/glassfish4/glassfish/lib/ && \
            sudo rm -f /tmp/mysql-5.1.44.zip && \
            sudo rm -r /tmp/mysql-connector-java-5.1.44/

RUN         sudo chmod -R 777  /usr/local/glassfish4/

EXPOSE      8080 4848 8181

WORKDIR     /usr/local/glassfish4