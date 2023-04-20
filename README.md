# JSON Diff - JSON Patch Generator

A JSON patch generator in Ruby that is compliant to the JSON Patch specification [RFC6902](http://www.rfc-editor.org/rfc/rfc6902.txt).

To apply a patch, you should use [hana](https://github.com/tenderlove/hana).

## Install

    gem install jsondiff

## Usage

```ruby
require 'jsondiff'

JsonDiff.generate({foo: :bar}, {foo: :plop})
```
=> will result in

```ruby
[{:op=>:replace, :path=>"/foo", :value=>:plop}]
```

## Tests

Load the submodules:

    git submodule update --init

Then launch rspec:

    bundle install
    bundle exec rspec

## Changelog

- 0.0.5:
  - Fix nil value in arrays
- 0.0.4:
  - Don't modify input objects
  - Fix the order when removing entry in an array
  - Add round trip tests with Hana and IETF tests
- 0.0.3:
  - Allow to compare root Hash and Array.
  - Performance improvements
- 0.0.2: Fix require 'jsondiff'
- 0.0.1: Initial release

## License

Copyright (c) 2013 François de Metz

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
