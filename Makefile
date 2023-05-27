help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

update-application: update-files update-java-files ## Update the application

update-files: build.gradle.kts settings.gradle.kts .github/workflows/build.yml ## Update all Gradle files
	@for file in $^; do \
		FILE_NAME="$${file}" make update-file; \
	done

update-java-files: $(shell find . -name "*.java") ## Update all Java files
	@for file in $^; do \
		FILE_NAME="$${file}" make update-java-file; \
	done

update-file: check ## Update a Gradle file
	@sed --in-place "s/$(INITIAL_APPLICATION_NAME)/$(REAL_APPLICATION_NAME)/g" $(FILE_NAME)
	@git add $(FILE_NAME)

update-java-file: check ## Update a Java file
	@mkdir -p $(shell dirname $(UPDATED_FILE_NAME))
	@sed "s/$(INITIAL_APPLICATION_NAME)/$(REAL_APPLICATION_NAME)/g" $(FILE_NAME) > $(UPDATED_FILE_NAME)
	@git rm $(FILE_NAME)
	@git add $(UPDATED_FILE_NAME)

check:
	@test -n '$(APPLICATION_NAME)' && test -n '$(FILE_NAME)' || { \
		echo "Usage:"; \
		echo "APPLICATION_NAME=new-application-name FILE_NAME=file-name make $(MAKECMDGOALS)"; \
		exit 1; \
	}

DASH:=-
UNDERSCORE:=_
REAL_APPLICATION_NAME=$(subst $(DASH),$(UNDERSCORE),$(APPLICATION_NAME))
INITIAL_APPLICATION_NAME=command_line_quickstart
UPDATED_FILE_NAME=$(shell echo $(FILE_NAME) | sed "s/$(INITIAL_APPLICATION_NAME)/$(REAL_APPLICATION_NAME)/")
