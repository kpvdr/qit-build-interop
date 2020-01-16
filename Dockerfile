FROM centos:7

RUN yum -q -y update && yum -q clean all

#RUN yum -y install sudo unzip wget git gcc-c++ make cmake maven swig java-1.8.0-openjdk-devel perl-XML-XPath python-devel procps-ng && \
#    yum -q -y install epel-release && \
#    yum -y python3-devel jsoncpp-devel && \
#    rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm && \
#    yum -y install dotnet-sdk-2.1 dotnet-runtime-2.1 && \
#    yum -q clean all

RUN yum -y install sudo unzip wget git gcc-c++ make cmake maven swig java-1.8.0-openjdk-devel perl-XML-XPath python-devel procps-ng 
RUN yum -y install epel-release && \
    yum -y python3-devel jsoncpp-devel
RUN rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm && \
    yum -y install dotnet-sdk-2.1 dotnet-runtime-2.1

ARG USER_ID=996
ARG GROUP_ID=994
RUN groupadd -g $GROUP_ID jenkins && useradd -u $USER_ID -s /bin/sh -g jenkins jenkins
RUN echo 'jenkins ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
