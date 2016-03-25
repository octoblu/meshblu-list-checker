_ = require 'lodash'
class ListChecker
  constructor: (@list) ->

  check: (uuid) =>
    return false unless _.isPlainObject @list
    keys = _.keys @list
    return true if _.includes keys, '*'
    _.includes keys, uuid

module.exports = ListChecker
