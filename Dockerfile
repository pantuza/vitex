FROM alpine:latest

RUN apk --update add make unzip texlive-full texlive-xetex

ADD . /doc
WORKDIR /doc

# Install font
RUN mkdir -p /usr/share/fonts/fontin && \
    cp fontin.zip /usr/share/fonts/fontin/ && \
	cd /usr/share/fonts/fontin/ && \
    unzip fontin.zip && \
    rm fontin.zip && \
    fc-cache -fv

