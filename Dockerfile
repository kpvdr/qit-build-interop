FROM centos:7

RUN yum -q -y update && yum -q clean all

RUN yum -y install sudo unzip wget git gcc-c++ make cmake maven swig java-1.8.0-openjdk-devel perl-XML-XPath python-devel python3-devel procps-ng epel-release && \
    yum -y install jsoncpp-devel nodejs npm python36-requests && \
    rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm && \
    yum -y install dotnet-sdk-2.1 dotnet-runtime-2.1 && \
    yum -q clean all

    RUN cd /etc/pki/ca-trust/source/anchors && \
        curl -O https://password.corp.redhat.com/RH-IT-Root-CA.crt && \
        update-ca-trust extract

ARG USER_ID=996
ARG GROUP_ID=994
RUN groupadd -g $GROUP_ID jenkins && useradd -u $USER_ID -s /bin/sh -g jenkins jenkins
RUN echo 'jenkins ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
ENV STAGGER_HTTP_URL='https://stagger-rhm.cloud.paas.psi.redhat.com'
ENV BODEGA_URL='https://bodega-rhm.cloud.paas.psi.redhat.com'
