# ti-mocha-builder [![Appcelerator Titanium](http://www-static.appcelerator.com/badges/titanium-git-badge-sq.png)](http://www.appcelerator.com/titanium/)

> The builder of ti-mocha.js

[ti-mocha](https://github.com/tonylukasavage/ti-mocha) is the mocha test runner for Titanium. Its documentation is available [here](http://tonylukasavage.com/ti-mocha/).

This repository is a fork of the original ti-mocha and reimplemented the build process. You can bundle any version of mocha into ti-mocha.

(README of original ti-mocha says it can change mocha version, but actual build process doesn't seem to work.)

# Usage

In the top of project,

```sh
make clean all
```

This makes ti-mocha.js to the current directory.

### Change mocha version

```sh
git submodule update --init # you need to do this only once.
cd mocha
git checkout 2.2.3
cd ..
make clean all # this makes ti-mocha with mocha version 2.2.3
```

# LICENSE

MIT
