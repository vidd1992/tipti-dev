# Usa la imagen oficial de Jenkins LTS
FROM jenkins/jenkins:lts

# Cambia al usuario root para poder instalar paquetes
USER root

# Instala Python, pip y los requisitos previos de Docker
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io

# Limpia la cache de APT para reducir el tamaño de la imagen
RUN curl https://cli-assets.heroku.com/install.sh | sh





# Cambia de nuevo al usuario jenkins para las operaciones de Jenkins
USER jenkins
