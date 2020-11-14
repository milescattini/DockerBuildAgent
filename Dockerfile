FROM ubuntu:18.04

# To make it easier for build and release pipelines to run apt-get,
# configure apt to not require confirmation (assume the -y argument by default)
ENV DEBIAN_FRONTEND=noninteractive
ARG terraformVersion
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

# Install Agent Pre-Requisites 
RUN apt-get update \
&& apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        jq \
        git \
        iputils-ping \
        libcurl4 \
        libicu60 \
        libunwind8 \
        netcat \
        libssl1.0 \ 
        wget \ 
        unzip \ 
        software-properties-common

# Install Terraform
RUN wget --quiet https://releases.hashicorp.com/terraform/0.13.3/terraform_0.13.3_linux_amd64.zip \
  && unzip terraform_0.13.3_linux_amd64.zip \
  && mv terraform /usr/bin \
  && rm terraform_0.13.3_linux_amd64.zip        

# Install Powershell
RUN apt-get install -y wget apt-transport-https \
  && wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb \
  && dpkg -i packages-microsoft-prod.deb \
  && apt-get update \
  && add-apt-repository universe \
  && apt-get install -y powershell 


# Install AZ Modules
 RUN pwsh -command Install-Module az -force
  
WORKDIR /azp

COPY ./start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]