FROM centos:7
MAINTAINER mrsiegfried

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

RUN echo 'for f in `ls *.T0*`' > trim2dat_folder.sh \
    && echo 'do' >> trim2dat_folder.sh \
    && echo '  echo converting $f to .dat' >> trim2dat_folder.sh \
    && echo '  runpkr00 -g -d $f' >> trim2dat_folder.sh \
    && echo 'done' >> trim2dat_folder.sh \
    && install -m 0755 trim2dat_folder.sh /usr/local/bin/ \
    && rm -rf trim2dat_folder.sh

RUN yum remove -y unzip

RUN groupadd --gid 1000 user \
    && useradd -g user -s /bin/bash --uid 1000 user

USER user
ENV HOME=/home/user

WORKDIR /home/user
