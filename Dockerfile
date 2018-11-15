FROM debian:stretch

RUN apt-get update -y -qq && apt-get install -y -qq python-pip wget unzip jq
RUN wget https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip && \
    unzip terraform_0.11.10_linux_amd64.zip && \
    mv terraform /usr/local/bin/terraform && \
    rm -rf terraform_0.11.10_linux_amd64.zip
RUN wget https://releases.hashicorp.com/packer/1.3.2/packer_1.3.2_linux_amd64.zip && \
    unzip packer_1.3.2_linux_amd64.zip && \
    mv packer /usr/local/bin/packer && \
    rm -rf packer_1.3.2_linux_amd64.zip
RUN pip install ansible
