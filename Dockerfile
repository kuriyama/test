FROM node:16

RUN apt-get -qq -y update && \
        apt-get -qq -y --no-install-recommends install curl ca-certificates tzdata unzip && \
        apt-get clean && \
	rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
