

SRC=$(shell find mocha/lib -name "*.js" -type f | sort)
SUPPORT=$(wildcard mocha/support/*.js)
TI_REPORTERS=$(shell find mocha/lib -name "src/reporters/*.js" -type f | sort)
TI_MAIN=src/util.js src/main.js

all: ti-mocha.js

mocha/node_modules/diff/diff.js:
	cd mocha ; npm install

mocha/node_modules/escape-string-regexp/index.js:
	cd mocha ; npm install

mocha/lib/browser/diff.js: mocha/node_modules/diff/diff.js
	cp mocha/node_modules/diff/diff.js mocha/lib/browser/diff.js

mocha/lib/browser/escape-string-regexp.js: mocha/node_modules/escape-string-regexp/index.js
	cp mocha/node_modules/escape-string-regexp/index.js mocha/lib/browser/escape-string-regexp.js

ti-mocha.js: $(SRC) $(SUPPORT) $(TI_REPORTERS) $(TI_MAIN) mocha/lib/browser/diff.js mocha/lib/browser/escape-string-regexp.js
	node mocha/support/compile $(SRC)
	cat \
	  mocha/support/head.js \
	  _mocha.js \
	  mocha/support/tail.js \
	  $(TI_REPORTERS) \
	  $(TI_MAIN) \
	  mocha/support/foot.js \
	  > ti-mocha.js

clean:
	rm -f ti-mocha.js
