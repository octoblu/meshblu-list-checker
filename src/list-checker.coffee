_ = require 'lodash'
class ListChecker
  constructor: (@list) ->

  check: (uuid) =>
    return true if _.some @list, uuid: '*'
    return true if _.some @list, uuid: uuid
    return false

module.exports = ListChecker
