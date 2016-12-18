###
  Doubly + Circular Linked List
  with length property and head tracking
###

class Node 
  constructor: (@item) ->
    @prev = null
    @next = null

class CircularLList
  constructor: () ->
    @length = 0
    @head = null
    @tail = null

  get: (index) ->
    currentNode = @head
    while(index-- && currentNode != null) 
      currentNode = currentNode.next 
    currentNode

  append: (item) ->
    node = new Node(item)
    if @length == 0
      @head = node
      @tail = node
      node.prev = @tail
      node.next = @head
    else
      # [t] <-  [n] ->  [h] 
      node.next = @head
      node.prev = @tail
      # [t] <-> [n] <-> [h] 
      node.prev.next = node # point old tail's next to this node
      node.next.prev = node # point head's prev to this node
      @tail = node # track this node as new tail
    @length += 1

  remove: (node) ->
    if @length > 1
      node.next.prev = node.prev # point previous node's next to node's next node
      node.prev.next = node.next # point next node's prev to node's previous
      if (node == @head)
        @head = node.next
      if (node == @tail)
        @tail = node.prev
    else
      @head = null
      @tail = null
    @length -= 1

  removeAt: (index) ->
    currentNode = @get(index)
    @remove(currentNode)

module.exports = CircularLList





