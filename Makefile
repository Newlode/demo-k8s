all: deps
	CGO_ENABLED=0 go build -a -o hello_world

deps:
	go get -d
	go get github.com/stretchr/testify
	go get github.com/golang/lint/golint
