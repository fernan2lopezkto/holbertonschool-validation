
help:                       ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'


build: | lint awesome-api    ## Build go binary.
ifeq (,$(wildcard ./go.mod))
	@go mod init github.com/jgnacio/awesome-api
	@go mod tidy
endif
	@go build -o awesome-api

run: awesome-api ##            run awesome-api server
	@./awesome-api >./awesome-api.log 2>&1 &

.PHONY: stop
stop: ##                       stop awesome-api server
	@kill $(shell pgrep awesome-api)

clean: ##                      delete log file and exe file
	@rm -f awesome-api.log awesome-api

test: ##                       test awesome-api server 
	@curl http://localhost:9999
	@curl http://localhost:9999/health

lint: ##                       lint for all files in the proyect.
	@golangci-lint run

unit-tests: ## Execute the Golang unit tests.
	@go test -v -short -coverprofile=coverage-units.out
