IMAGE ?= desyncr/gitlab-ci-php7

build:
	docker build . -t ${IMAGE}
publish:
	docker push ${IMAGE}
