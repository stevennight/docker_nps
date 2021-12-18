FROM ubuntu
RUN cd /root \
    && cp /etc/apt/sources.list /etc/apt/sources.list.bak \
    && sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list \
    && apt-get update \
    && apt-get install curl -y \
    && curl -Lo server.tar.gz https://github.com/ehang-io/nps/releases/download/v0.26.10/linux_amd64_server.tar.gz \
    && mkdir nps \
    && tar -xvzf server.tar.gz -C ./nps \
    && cd ~/nps \
    && ./nps install

WORKDIR /root/nps
CMD ./nps
