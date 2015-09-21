FROM alpine:latest
MAINTAINER Andrew Grigorev <andrew@ei-grad.ru>
ENTRYPOINT ["ambassador"]
RUN apk update && \
    apk add openssh-client
COPY ambassador /bin/ambassador
COPY ssh_config /etc/ssh/ssh_config
