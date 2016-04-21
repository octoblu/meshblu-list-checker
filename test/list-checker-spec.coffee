_      = require 'lodash'
ListChecker = require '..'

describe 'check', ->
  context 'when a list an array, but not of objects', ->
    beforeEach ->
      uuid = 'a'
      list = ['a', 'b']

      @sut = new ListChecker list
      @inList = @sut.check uuid

    it 'should return false', ->
      expect(@inList).to.be.false

  context 'when a list an object', ->
    beforeEach ->
      uuid = 'a'
      list = {'a': true, 'b': true}

      @sut = new ListChecker list
      @inList = @sut.check uuid

    it 'should return false', ->
      expect(@inList).to.be.false

  context 'when a uuid is in an undefined list', ->
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
      list = [{uuid: 'a'}]

      @sut = new ListChecker list
      @inList = @sut.check uuid

    it 'should return true', ->
      expect(@inList).to.be.true

  context 'when a uuid is not in a list', ->
    beforeEach ->
      uuid = 'a'
      list = []

      @sut = new ListChecker list
      @inList = @sut.check uuid

    it 'should return false', ->
      expect(@inList).to.be.false

  context 'when the list has a *', ->
    beforeEach ->
      list = [{uuid: '*'}]

      @sut = new ListChecker list
      @inList = @sut.check 'anything'

    it 'should return true', ->
      expect(@inList).to.be.true
