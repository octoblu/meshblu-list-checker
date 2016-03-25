_ = require 'lodash'
class ListChecker
  constructor: (@list) ->
    @keys = _.keys @list

  check: (uuid) =>
    return true if _.includes @keys, '*'
    _.includes @keys, uuid

module.exports = ListChecker
