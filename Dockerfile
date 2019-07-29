FROM golang
ENV GOPATH="/go"
ENV GO_PATH="/go"
WORKDIR /go/src
RUN pwd
RUN git clone https://github.com/daredevil17/todo-service.git
WORKDIR /go/src
RUN go get github.com/golang/dep/cmd/dep
RUN go get -u github.com/golang/protobuf/protoc-gen-go
RUN go get -u github.com/go-sql-driver/mysql 
RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
WORKDIR /go/src/todo-service
RUN dep ensure
RUN pwd
RUN apt-get update && apt-get install -y vim
EXPOSE 9090 8080 7000 3306

