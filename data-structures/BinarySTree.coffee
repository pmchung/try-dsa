class Node
  constructor: (@item, @parent = null) ->
    @left = @right = null

class BinarySTree
  constructor: (@root = null) ->
    @length = 0
    return

  find: (item) ->
    currentNode = @parent
    while currentNode?
      if item == currentNode.item
        return currentNode
      currentNode = if item < currentNode.item then currentNode.left else currentNode.right
    currentNode

  insert: (item) ->
    if @length == 0
      @root = new Node(item)
    else
      currentNode = @root # for recursive insert
      while currentNode?
        currentNode = if currentNode.left > item then currentNode.left else currentNode.right
      currentNode = new Node(item)
    @length += 1

  delete: (item) ->
    if @length == 0
      return 0

module.exports = BinarySTree




