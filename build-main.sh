docker buildx build --tag liyuanbiao/sing-box:main --tag liyuanbiao/sing-box:$1 --build-arg SING_BOX_VERSION=$1 --push --platform linux/amd64,linux/amd64/v3,linux/arm64,linux/arm/v7,linux/s390x .
