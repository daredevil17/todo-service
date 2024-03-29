export GO_PATH=$HOME/workspace/Go
export PROTO_PATH=$GO_PATH/src/todo-service/dm/proto-files
#add this path to ensure all protoc plugins can execute
export PATH=$PATH:$GO_PATH/bin 

protoc -I $GO_PATH/src --go_out=$GO_PATH/src $PROTO_PATH/domain/repository.proto
protoc -I $GO_PATH/src --go_out=plugins=grpc:$GO_PATH/src $PROTO_PATH/service/repository-service.proto

#TODO
protoc -I $GO_PATH/src --proto_path=$PROTO_PATH/service:$PROTO_PATH/domain --go_out=plugins=grpc:$GO_PATH/src  --proto_path=third_party $PROTO_PATH/domain/todo.proto

protoc -I $GO_PATH/src  --proto_path=$PROTO_PATH/service:$PROTO_PATH/domain --go_out=plugins=grpc:$GO_PATH/src --proto_path=third_party $PROTO_PATH/service/todo-service.proto

protoc  --proto_path=$PROTO_PATH/service:$PROTO_PATH/domain --proto_path=third_party --grpc-gateway_out=logtostderr=true:$GO_PATH/src $PROTO_PATH/service/todo-service.proto

protoc  --proto_path=$PROTO_PATH/service:$PROTO_PATH/domain  --proto_path=third_party --swagger_out=logtostderr=true:api/swagger/service $PROTO_PATH/service/todo-service.proto
