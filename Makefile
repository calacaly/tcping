.PHONY: default
default: build

build: clean
	@bash build.sh build

release: clean
	@bash build.sh release

test:
	@bash build.sh test

clean:
	@bash build.sh clean