#!/usr/bin/env bash

PATH=$PATH:~/go/bin

cd frontend && npm install && npm run build && cd ..

#packr2


~/go/bin/packr2

#CGO_ENABLED=1 GOOS=linux GOARCH=${GOARCH:-amd64} go build -a -tags netgo -ldflags "-linkmode external -extldflags -static -s -w" $@

go build -ldflags="-s -w" -o ovpn-admin $@

#packr2 clean
~/go/bin/packr2 clean
