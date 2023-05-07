RM = rm -r

help:           ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

.PHONY: clean
clean: ## Clean the entire distro folder
	@$(RM) ./dist/*

.PHONY: build
build: ## Build the site with hugo.
	@hugo -d dist
.PHONY: post

post: ## Create a new post.
	@hugo new posts/$(POST_NAME).md
	@sed -i '/title:/c\title: "$(POST_TITLE)"' content/posts/$(POST_NAME).md