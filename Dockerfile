FROM registry.access.redhat.com/ubi8/ubi

RUN yum -q -y update && yum -q clean all

# sed cmd below is temporary to fix inconsistency with Microsoft's base URL - they could fix it any time
RUN dnf -y install sudo unzip wget git gcc-c++ make cmake maven python2-devel python3-devel procps-ng && \
    dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm && \
    dnf -y install jsoncpp-devel nodejs python36-requests && \
    dnf -y install https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm && \
    sed -i 's|rhel/8.0|rhel/8|g' /etc/yum.repos.d/microsoft-prod.repo && \
    dnf -y install dotnet-sdk-2.1 dotnet-runtime-2.1 && \
    dnf -q clean all

    RUN cd /etc/pki/ca-trust/source/anchors && \
        curl -O https://password.corp.redhat.com/RH-IT-Root-CA.crt && \
        update-ca-trust extract

ARG USER_ID=996
ARG GROUP_ID=994
RUN groupadd -g $GROUP_ID jenkins && useradd -u $USER_ID -s /bin/sh -g jenkins jenkins
RUN echo 'jenkins ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
ENV STAGGER_HTTP_URL='https://stagger-rhm.cloud.paas.psi.redhat.com'
ENV BODEGA_URL='https://bodega-rhm.cloud.paas.psi.redhat.com'
