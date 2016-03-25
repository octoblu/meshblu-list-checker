_      = require 'lodash'
ListChecker = require '..'

describe 'check', ->
  context 'when a uuid is in a list', ->
    beforeEach ->
      uuid = 'a'
      list = undefined

      @sut = new ListChecker list
      @inList = @sut.check uuid

    it 'should return false', ->
      expect(@inList).to.be.false

  context 'when a uuid is in a list', ->
    beforeEach ->
      uuid = 'a'
      list =
        a: {}

      @sut = new ListChecker list
      @inList = @sut.check uuid

    it 'should return true', ->
      expect(@inList).to.be.true

  context 'when a uuid is not in a list', ->
    beforeEach ->
      uuid = 'a'
      list = {}

      @sut = new ListChecker list
      @inList = @sut.check uuid

    it 'should return false', ->
      expect(@inList).to.be.false

  context 'when the list has a *', ->
    beforeEach ->
      list = '*': {}

      @sut = new ListChecker list
      @inList = @sut.check 'anything'

    it 'should return true', ->
      expect(@inList).to.be.true
