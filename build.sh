#!/bin/bash

NAME=tcping
BUILDDIR=build
VERSIO=dev

ARCHS="amd64 386 arm arm64"
OSS="darwin linux windows"

function go_build() {
    mkdir -p ${BUILDDIR}
    cp LICENSE ${BUILDDIR}/
	cp README.md ${BUILDDIR}/
    export CGO_ENABLED=0
    go build -o ${BUILDDIR}/${NAME}
}

function go_test() {
	go test -race -v -bench=. ./...
}

function clean() {
	go clean
	rm -rf ${BUILDDIR}
}


function go_all_release(){
    mkdir -p ${BUILDDIR}
	cp LICENSE ${BUILDDIR}/
	cp README.md ${BUILDDIR}/
    for OS in ${OSS}; do
        for ARCH in ${ARCHS}; do
            go_build_release ${OS} ${ARCH}
        done
    done
}

function go_build_release() {
    OS=$1
    ARCH=$2
    ext=""
    if [[ ${OS} == "windows" ]]; then
        ext=".exe"
    fi
    export CGO_ENABLED=0
    export GOOS=${OS}
    export GOARCH=${ARCH}
    go build -o ${BUILDDIR}/${NAME}_v${VERSION}_${OS}_${ARCH}${ext}
}

function main() {
    case "$1" in
        "build")
            go_build
            ;;
        "test")
            go_test
            ;;
        "clean")
            clean
            ;;
        "release")
            go_all_release
            ;;
        *)
            echo "Usage: $0 [build|test|clean|release]"
            exit 1
            ;;
    esac
}

main "$@"