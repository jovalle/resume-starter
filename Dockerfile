FROM ubuntu:latest
ARG TARGETARCH
USER root
RUN apt update -y
RUN apt install wget git ca-certificates -y
RUN wget https://github.com/gohugoio/hugo/releases/download/v0.126.1/hugo_extended_0.126.1_linux-${TARGETARCH}.tar.gz && \
    tar -xvzf hugo_extended_0.126.1_linux-${TARGETARCH}.tar.gz  && \
    chmod +x hugo && \
    mv hugo /usr/local/bin/hugo && \
    rm -rf hugo_extended_0.126.1_linux-${TARGETARCH}.tar.gz
ADD resume /hugo
CMD ["/usr/local/bin/hugo", "-s", "/hugo", "server", "-D", "--bind", "0.0.0.0", "--port", "30000"]