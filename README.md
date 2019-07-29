# Pre-requisite
- Install Go 
- Download Proto compiler
- Get Go lang proto compiler package
<br/>
<code>go get -u github.com/golang/protobuf/protoc-gen-go</code>

- Install mysql golang package
<code>go get -u github.com/go-sql-driver/mysql</code>
-  Install MYSQL database
-  Create database "testdb"
-  Create table 
<code>
CREATE TABLE `ToDo` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `Title` varchar(200) DEFAULT NULL,
  `Description` varchar(1024) DEFAULT NULL,
  `Reminder` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
);
</code>
<br/>
- Install grpc-gateway and swagger documentation generation plugin
<code>
go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
</code>
<br/>
<code>
go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
</code>

# todo-service
#server start
go run cmd/grpc/server/server-todo-main.go -grpc-port=9090 -http-port=8080 -db-host=127.0.0.1:3306 -db-user=root -db-password=<pass> -db-schema=testdb

#client rest test
#cd todo-service/cmd/client-rest
#go run main.go -server=http://localhost:8080

#client grpc test
#cd todo-service/cmd/grpc/client/
#go run client-todo-main.go -server=localhost:9090


# Docker commands

- list of all docker images
docker images

- view all running docker containers 
docker ps -a

- remove docker image
docker rm <container Id>
docker rmi go-todo-service:0.1

- removing a pattern image
docker ps -a | grep "<pattern" | awk '{print $2}' | xargs docker rmi

- create image
docker image build --no-cache -t go-todo-service:0.2 .

- running docker command
docker run  <image name>
e.g.: docker run -it  go-todo-service:0.1

- 