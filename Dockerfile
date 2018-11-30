FROM golang:1.9.2-alpine AS build
WORKDIR /go/src/
COPY Makefile *.go ./
ENV GIN_MODE debug
RUN apk update && \
	apk upgrade && \
	apk add \
		git \
	make && \
	make all

FROM gcr.io/distroless/base
COPY --from=build /go/src/hello_world /
ENV GIN_MODE release
EXPOSE 8080
ENTRYPOINT ["/hello_world"]
