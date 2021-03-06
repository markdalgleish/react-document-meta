BIN   = ./node_modules/.bin
PATH := $(BIN):$(PATH)
LIB   = $(shell find lib -name "*.js")
DIST   = $(patsubst lib/%.js,dist/%.js,$(LIB))

install:
	@npm $@

dist: $(DIST)
dist/%.js: lib/%.js
	@mkdir -p $(@D)
	$(BIN)/babel $< -o $@

lint:
	@ $(BIN)/eslint ./lib ./example

test: lint
	@echo "\nTesting source files, hang on..."
	@NODE_ENV=test $(BIN)/mocha          \
		--require babel-register \
		--require lib/__tests__/testdom    \
		./lib/__tests__/*.test.js

test-build:
	@echo "\nTesting build files, almost there..!"
	@NODE_ENV=test $(BIN)/mocha         \
		--require dist/__tests__/testdom  \
		./dist/__tests__/*.test.js

clean:
	@rm -rf ./dist

build: test clean dist test-build

dev:
	@ node ./example/client-side/server.js

dev-ssr:
	@ babel-node ./example/server-side/server.js

release: build
	@ npm publish

.PHONY: install dev test clean dist test-build build