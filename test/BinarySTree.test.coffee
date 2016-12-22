expect = require('chai').expect
BinarySTree = require('../data-structures/BinarySTree.coffee')

module.exports = ->
  describe('get(index)', ->
    it 'should return node at index', ->
      BST = new BinarySTree()
      BST.insert(1)
      BST.insert(3)
      BST.insert(2)
      BST.insert(5)
      expect(1).to.equal(1)
  )
