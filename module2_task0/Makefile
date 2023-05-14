
help:           ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

.PHONY: build
build: main.go ## Build go binary.
ifeq (,$(wildcard ./go.mod))
	@go mod init github.com/jgnacio/awesome-api
	@go mod tidy
endif
	@go build -o awesome-api

.PHONY: run
run: ## run this
	@./awesome-api >./awesome-api.log 2>&1 &

.PHONY: stop
stop: ## stop this
	@kill "$(pgrep awesome-api)"

.PHONY: clean
clean: ## delete log file
	@rm awesome-api.log
