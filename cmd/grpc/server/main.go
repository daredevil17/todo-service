package main

import (
	"fmt"
	"log"
	"net"
	"todo-service/dm/grpc/impl"
	"todo-service/dm/grpc/service"

	"google.golang.org/grpc"
)

func main() {
	netListener := getNetListener(7000)
	grpcServer := grpc.NewServer()

	repositoryServiceImpl := impl.NewRepositoryServiceGrpcImpl()
	service.RegisterRepositoryServiceServer(grpcServer, repositoryServiceImpl)

	// start the server
	if err := grpcServer.Serve(netListener); err != nil {
		log.Fatalf("failed to serve: %s", err)
	}

}

func getNetListener(port uint) net.Listener {
	lis, err := net.Listen("tcp", fmt.Sprintf(":%d", port))
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
		panic(fmt.Sprintf("failed to listen: %v", err))
	}

	return lis
}
