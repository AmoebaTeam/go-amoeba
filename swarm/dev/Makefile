.PHONY: build cluster test

default: build

build:
	go build -o bin/swarm    github.com/AmoebaTeam/go-amoeba/cmd/swarm
	go build -o bin/geth     github.com/AmoebaTeam/go-amoeba/cmd/geth
	go build -o bin/bootnode github.com/AmoebaTeam/go-amoeba/cmd/bootnode

cluster: build
	scripts/boot-cluster.sh

test:
	go test -v github.com/AmoebaTeam/go-amoeba/swarm/...
