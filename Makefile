

SRC=$(shell find mocha/lib -name "*.js" -type f | sort)
SUPPORT=$(wildcard mocha/support/*.js)
TI_STUB=src/stub.js
TI_REPORTERS=$(shell find src/reporters -name "*.js" -type f | sort)
TI_MAIN=src/util.js src/main.js

all: ti-mocha.js

mocha/node_modules:
	cd mocha ; npm install

mocha/_mocha.js: mocha/node_modules
	cd mocha ; make clean all

ti-mocha.js: mocha/_mocha.js
	cat \
	  mocha/support/head.js \
	  $(TI_STUB) \
	  mocha/_mocha.js \
	  mocha/support/tail.js \
	  $(TI_REPORTERS) \
	  $(TI_MAIN) \
	  mocha/support/foot.js \
	  > ti-mocha.js

clean:
	rm -f mocha/_mocha.js
	rm -f ti-mocha.js
