FROM centos:6
MAINTAINER sean0921

RUN  yum update -y    \
     && yum clean all  \
     && yum install --nogpgcheck -y \
        unzip

RUN groupadd --gid 1000 user \
    && useradd -g user -s /bin/bash --uid 1000 user

USER user
ENV HOME=/home/user

RUN mkdir -p /home/user/bin \
    && cd /home/user/bin    \
    && curl -LO https://www.unavco.org/software/data-processing/teqc/development/teqc_CentOSLx86_64d.zip \
    && unzip teqc_CentOSLx86_64d.zip
ENV PATH="${PATH}:/home/user/bin"

WORKDIR /home/user
CMD ["sh","-c","/home/user/teqc"]
