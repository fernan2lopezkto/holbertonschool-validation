## Prerequisites

-A Valid Go-Hugo website is provided

-There are no Git Submodules

-The theme ananke is installed

-No directory dist/ committed

-Makefile present

## Lifecycle

- build: compile the source code of the application to a binary named awesome-api (the name awesome-api comes from the command go mod init github.com/<your github handle>/awesome-api) with the command go build. The first build may takes some times.

- run: Run the application in background by executing the binary awesome-api, and write logs into a file named awesome-api.log with the command ./awesome-api >./awesome-api.log 2>&1 &.

- post: Create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME.

- stop: Stop the application with the command pkill XXXXX where XXXXX is the binary name. For instance: pkill awesome-api.

- clean: Stop the application. Delete the binary awesome-api and the log file awesome-api.log.

- test: Test the application using unit and integration tests.

- help: Print a list of all the goals.

- lint: Fail when the linter catches an error.

- unit-tests: Execute (successfully) the Golang unit tests.

- integration-tests: Execute (successfully) the Golang integration tests.

- check: Succeed by default, and fail when presented with a dead link or a badly written Markdown file

- validate: Always succeed by default and should print the result on the stdout