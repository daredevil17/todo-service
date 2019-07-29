FROM golang
ENV GOPATH="/go/bin"
ENV GO_PATH="/go"
#ENV GOBIN="/go/bin"
WORKDIR /go/src
RUN pwd
RUN git clone https://github.com/daredevil17/todo-service.git
WORKDIR /go/src
RUN go get -u github.com/golang/protobuf/protoc-gen-go; go get -u github.com/go-sql-driver/mysql; go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
RUN pwd
#RUN go get -u github.com/go-sql-driver/mysql
#RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
#RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
WORKDIR /go/src/todo-service