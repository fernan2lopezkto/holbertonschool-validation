
help:           ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'


build: main.go ## Build go binary.
ifeq (,$(wildcard ./go.mod))
	@go mod init github.com/jgnacio/awesome-api
	@go mod tidy
endif
	@go build -o awesome-api

run: awesome-api ## run this
	@./awesome-api >./awesome-api.log 2>&1 &

.PHONY: stop
stop: ## stop this
	@pkill $(shell pgrep awesome-api)

clean: ## delete log file
	@rm -r awesome-api.log

test:
	@curl http://localhost:9999
	@curl http://localhost:9999/health
