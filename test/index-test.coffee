chai            = require 'chai'
sinon           = require 'sinon'
sinonChai       = require 'sinon-chai'
should          = chai.should()
expect          = chai.expect
assert          = chai.assert
chai.use(sinonChai)

setImmediate    = setImmediate || process.nextTick

minimatch       = require '../src'

describe 'minimatch-ex', ->
  it 'should match a single pattern correctly', ->
    result = minimatch 'test.md', '*.md'
    result.should.be.true
    result = minimatch 'test.md', ['*.md']
    result.should.be.true
    result = minimatch 'test.m', ['*.md']
    result.should.be.false
    result = minimatch 'test.md'
    result.should.be.false

  it 'should match a multi patterns correctly', ->
    result = minimatch 'a/b/test.md', ['*.txt', '*.m', '*.md', '**/*.md']
    result.should.be.true

  it 'should match a negative patterns correctly', ->
    result = minimatch 'a/b/test.md', ['*.txt', '*.m', '*.md', '!**/*.md']
    result.should.be.false
