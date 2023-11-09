FROM jenkins/jenkins:lts
USER root

# Instala la versión disponible de Python 3 y pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip

# Enlace simbólico para python3 a python
RUN ln -s /usr/bin/python3 /usr/bin/python

# Cambia de nuevo al usuario jenkins
USER jenkins
