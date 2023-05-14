## Learning Objectives
This project aims at practicing with automated tests. The goal is to understand the pros and cons of 
different testing methods to be able to understand the value of doing, or not doing, a kind of test.<br>

After this project, you should be able to:
- Understand what linting is the extent of its usages (which kind of file can be linted, and the impact of running it often)
- Understand the difference between unit tests and integration tests
- Use code coverage as a helper to write tests
- Understand that not only “classical” code is to be tested, but also a lot of the artifacts we can generate
- Understand how “component”-based testing for acceptance and end to end validation is to be used <br>

## Prerequisites
The following elements are required In addition to the previous module (“Module 1: Introduction to DevOps: Automate Everything to Focus on What Really Matters”) prerequisites.<br>

## Tooling
This project needs the following tools / services:
<br><br>
- Same tools as previous module
- Golang in v1.15.*
- NPM v7+ with NodeJS v14.* (stable)
- Python 3 with pip module
- golangci-lint<br><br><br>




## Lifecycle

The life-cycle of this project is defined by the following goals:

- `build`: compile the source code of the application to a binary named `awesome-api` with the command `make build`. The first build may take some time.
- `run`: run the application in the background by executing the binary `awesome-api` and write logs into a file named `awesome-api.log` with the command `./awesome-api >./awesome-api.log 2>&1 &`.
- `stop`: stop the application with the command `kill <pid-of-awesome-api>` where `<pid-of-awesome-api>` is the Process ID of the application. For instance, `kill "$(pgrep awesome-api)"`.
- `clean`: stop the application, delete the binary `awesome-api` and the log file `awesome-api.log`.
- `test`: test the application to ensure that it behaves as expected.

### Makefile commands
* **help**
	```bash
	make help
	```

	Displays a list of targets and their descriptions.

* **build**

	```bash
	make build
	```

	Compiles the source code of the application into a binary named `awesome-api`. If the `go.mod` file is missing, it is generated automatically. 

* **run**

	```bash
	make run
	```

	Runs the `awesome-api` application in the background and writes logs into a file named `awesome-api.log`.

* **stop**

	```bash
	make stop
	```

	Kills the `awesome-api` application process.

* **clean**

	```bash
	make clean
	```

	Stops the `awesome-api` application, removes the binary `awesome-api`, and deletes the log file `awesome-api.log`.

* **test**

	```bash
	make test
	```

	Tests the `awesome-api` application by sending HTTP requests to the server. If the server is running, it should respond with a message indicating that it is alive. If the requested path is `/`, the server should return a `404 Not Found` response, then sending another HTTP request to `/health`, if the server is running should return `ALIVE`.

* **unit-tests**
    ```bash
    make unit-tests
    ```
    Check unit test for projects

* **lint**
	To maintain the quality of the codebase, it's good practice to use a linter to check for code style and formatting issues. This project uses the [golangci-lint](https://golangci-lint.run/) linter. To add the linter to the project, follow these steps:

	1. Install golangci-lint by following the instructions in the [official documentation](https://golangci-lint.run/usage/install/#local-installation). 

	2. Once you have installed the linter, add the following command to the Makefile:

	```bash
	make lint
	```
	
	This command will run the golangci-lint linter on all Go files in the project.
