CircularLList = require('../data-struct/CircularLList.coffee')

josephus = (num) ->
  if num < 1
    return 0
  Circle = new CircularLList()
  # set up the soldiers
  for i in [1..num]
    do(i) -> Circle.append(i);
  # start removing
  removeNode = Circle.head.next
  while(Circle.length > 1)
    do -> 
      Circle.remove(removeNode)
      removeNode = removeNode.next.next
  Circle.head.item

module.exports = josephus
