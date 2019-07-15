TAG?=$(shell git rev-list HEAD --max-count=1 --abbrev-commit)
export TAG

install:
	go get -t .

test:
	go test ./...

# build:
#     go build -ldflags "-X main.version=$(TAG)" -o gorouters .

pack:
	docker build -t registry-intl.ap-southeast-5.aliyuncs.com/sandbox-jai/sandbox-repo:$(TAG) .

upload:
	docker push registry-intl.ap-southeast-5.aliyuncs.com/sandbox-jai/sandbox-repo:$(TAG)

deploy:
	envsubst < k8s/deployment.yaml | kubectl apply -f -

ship: test pack upload deploy