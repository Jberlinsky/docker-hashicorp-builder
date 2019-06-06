FROM debian:stretch

RUN apt-get update -y -qq && apt-get install -y -qq python-pip wget unzip jq openssh-client shellcheck git curl
RUN wget https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip && \
    unzip terraform_0.11.10_linux_amd64.zip && \
    mv terraform /usr/local/bin/terraform && \
    rm -rf terraform_0.11.10_linux_amd64.zip
RUN wget https://releases.hashicorp.com/packer/1.3.2/packer_1.3.2_linux_amd64.zip && \
    unzip packer_1.3.2_linux_amd64.zip && \
    mv packer /usr/local/bin/packer && \
    rm -rf packer_1.3.2_linux_amd64.zip
RUN pip install ansible
RUN wget https://github.com/segmentio/terraform-docs/releases/download/v0.5.0/terraform-docs-v0.5.0-linux-amd64 && \
    mv ./terraform-docs-v0.5.0-linux-amd64 /usr/local/bin/terraform-docs && \
    chmod +x /usr/local/bin/terraform-docs && \
    rm -rf terraform-docs-v0.5.0-linux-amd64
RUN pip install flake8
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl
RUN wget https://dl.google.com/go/go1.12.2.linux-amd64.tar.gz && \
    tar -xvf go1.12.2.linux-amd64.tar.gz && \
    mv go /usr/local && \
    rm -rf go1.12.2.linux-amd64.tar.gz
RUN mkdir /usr/src/go
ENV GOROOT=/usr/local/go
ENV GOPATH /usr/src/go
ENV PATH $GOPATH/bin:$GOROOT/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN go get -u -v github.com/kubernetes-sigs/aws-iam-authenticator/cmd/aws-iam-authenticator
