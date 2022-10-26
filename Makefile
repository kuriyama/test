all:

cron: pull etag check

pull:
	@docker pull node:12 > .log-12
	@docker pull node:14 > .log-14
	@docker pull node:16 > .log-16
	@docker image inspect node:12 | jq -r '.[0].Id' > .id-12
	@docker image inspect node:14 | jq -r '.[0].Id' > .id-14
	@docker image inspect node:16 | jq -r '.[0].Id' > .id-16

etag:
	@curl -s -D- --head HEAD https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip | \
	grep ^ETag | uniq | sed -e 's|^ETag: ||' | jq -r . > .etag

check:
	@if git status -s | grep -q M; then\
		git add .etag .id-12 .id-14 .id-16 && git commit -m "Update IDs."; git push;\
	fi
