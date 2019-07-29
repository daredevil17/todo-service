FROM golang
ENV GOPATH="/go"
ENV GO_PATH="/go"
WORKDIR /go/src
RUN pwd
RUN git clone https://github.com/daredevil17/todo-service.git
RUN go get -u github.com/golang/protobuf/protoc-gen-go
RUN go get -u github.com/go-sql-driver/mysql
RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
