CircularLList = require('../data-struct/CircularLList.coffee')

josephus = (num, k) ->
  if num < 1
    return 0
  Circle = new CircularLList()
  # set up the soldiers
  for i in [1..num]
    do(i) -> Circle.append(i);
  # start removing
  removeNode = Circle.step(Circle.head, k - 1)
  while(Circle.length > 1)
    do -> 
      Circle.remove(removeNode)
      removeNode = Circle.step(removeNode, k)
  Circle.head.item

module.exports = josephus
