FROM gcr.io/google-containers/pause:latest
FROM debian:sid
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y \
        && apt-get install -y curl dnsutils jq vim kubernetes-client tmux ldap-utils
COPY --from=0 /pause /usr/local/bin/pause
CMD ["/usr/local/bin/pause"]
