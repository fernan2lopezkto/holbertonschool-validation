RM = rm -r

.PHONY: clean
clean: $(RM) ./dist/*

.PHONY: build
build:
	@hugo -d dist
.PHONY: post

post:; 
	@hugo new posts/$(POST_NAME).md
	@sed -i '/title:/c\title: "$(POST_TITLE)"' content/posts/$(POST_NAME).md