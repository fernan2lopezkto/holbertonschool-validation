
help:           ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

.PHONY: build
build: main.go ## Build go binary.
ifeq (,$(wildcard ./go.mod))
	@go mod init github.com/jgnacio/awesome-api
	@go mod tidy
endif
	@go build -o awesome-api
