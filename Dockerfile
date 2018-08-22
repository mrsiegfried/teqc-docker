FROM centos:6
MAINTAINER sean0921

RUN  yum update -y    \
     && yum clean all  \
     && yum install --nogpgcheck -y \
        unzip man

RUN rpm -ivh http://kb.unavco.org/kb/assets/744/runpkr00-5.40-1trmb.i586.rpm

RUN mkdir /teqc \
    && cd /teqc  \
    && curl -LO https://www.unavco.org/software/data-processing/teqc/development/teqc_CentOSLx86_64d.zip \
    && unzip teqc_CentOSLx86_64d.zip  \
    && install -m 0755 teqc /usr/local/bin/ \
    && cd / && rm -rf /teqc

RUN yum remove -y unzip

RUN groupadd --gid 1000 user \
    && useradd -g user -s /bin/bash --uid 1000 user

USER user
ENV HOME=/home/user

WORKDIR /home/user
