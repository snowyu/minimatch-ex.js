## minimatch-ex [![npm](https://img.shields.io/npm/v/minimatch-ex.svg)](https://npmjs.org/package/minimatch-ex)

[![Build Status](https://img.shields.io/travis/snowyu/minimatch-ex.js/master.svg)](http://travis-ci.org/snowyu/minimatch-ex.js)
[![Code Climate](https://codeclimate.com/github/snowyu/minimatch-ex.js/badges/gpa.svg)](https://codeclimate.com/github/snowyu/minimatch-ex.js)
[![Test Coverage](https://codeclimate.com/github/snowyu/minimatch-ex.js/badges/coverage.svg)](https://codeclimate.com/github/snowyu/minimatch-ex.js/coverage)
[![downloads](https://img.shields.io/npm/dm/minimatch-ex.svg)](https://npmjs.org/package/minimatch-ex)
[![license](https://img.shields.io/npm/l/minimatch-ex.svg)](https://npmjs.org/package/minimatch-ex)


The minimatch extend to support the multi-patterns and negative pattern.

- * matches any number of characters, but not /
- ? matches a single character, but not /
- ** matches any number of characters, including /, as long as it's the only thing in a path part
- {} allows for a comma-separated list of "or" expressions
- ! at the beginning of a pattern will negate the match

## Usage

```js
var minimatch  = require('minimatch-ex')

minimatch('foo.bar', ['*', '*.b*', '!.ignore'])
```

## API


## TODO


## License

MIT
