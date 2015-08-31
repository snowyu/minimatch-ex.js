minimatch   = require 'minimatch'
isFunction  = require 'util-ex/lib/is/type/function'
isString    = require 'util-ex/lib/is/type/string'
isArray     = require 'util-ex/lib/is/type/array'
extend      = require 'util-ex/lib/_extend'


sortPatterns = (patterns)->
  if patterns?
    patterns = [patterns] unless isArray patterns
  else
    patterns = []

  positives = []
  negatives = []

  patterns.forEach (pattern, index)->
    isNegative = pattern[0] == '!'
    (if isNegative then negatives else positives).push
      index: index
      pattern: if isNegative then pattern.slice(1) else pattern

  result =
    positives: positives
    negatives: negatives

getIgnore = (negatives, positiveIndex, ignore)->
  ignore ?= []

  negativePatterns = negatives.filter (negative)->
    negative.index > positiveIndex
  .map (negative)->
    negative.pattern

  ignore = ignore.concat(negativePatterns)

match = (path, patterns, options)->
  for pattern in patterns
    result = minimatch path, pattern, options
    break if result
  result

module.exports = (file, patterns, options)->
  sortedPatterns = sortPatterns(patterns)
  positives = sortedPatterns.positives
  result = false
  return result if sortedPatterns.positives.length == 0
  negatives = sortedPatterns.negatives
  ignore = options.ignore if options

  for positive in positives
    result = minimatch file, positive.pattern, options
    if result
      patterns = getIgnore negatives, positive.index, ignore
      result = !match file, patterns, options
      break if result
  result
