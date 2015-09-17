FROM gliderlabs/alpine:3.1
ENTRYPOINT ["ambassador"]
RUN apk update && apk-install openssh-client
COPY ambassador /bin/ambassador
RUN adduser -D ambassador
ADD ssh_config /etc/ssh/ssh_config
RUN install 0500 -o ambassador -d /keys

USER ambassador
