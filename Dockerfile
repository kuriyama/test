FROM amazonlinux:2023
RUN dnf -qq -y install awscli && \
        rm -fr /var/cache/dnf/* && \
        dnf -q clean all
