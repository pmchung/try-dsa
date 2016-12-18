### 
  People are standing in a circle waiting to be executed. Counting
  begins at a specified point in the circle and proceeds around the
  circle in a specified direction. After a specified number of people
  are skipped, the next person is executed. The procedure is repeated
  with the remaining people, starting with the next person, going in the
  same direction and skipping the same number of people, until only one
  person remains, and is freed.

  The problem — given the number of people, starting point, direction,
  and number to be skipped — is to choose the position in the initial
  circle to avoid execution.
###

CircularLList = require('../data-struct/CircularLList.coffee')

josephus = (num, k) ->
  if num < 1
    return 0
  Circle = new CircularLList()
  # set up the soldiers
  for i in [1..num]
    do(i) -> Circle.append(i);
  # start removing
  soldier = Circle.step(Circle.head, k - 1) # starting at 1 so skip by k-1
  while(Circle.length > 1)
    do -> 
      Circle.remove(soldier) # kill this soldier
      soldier = Circle.step(soldier, k) # go to soldier 2 steps from current
  Circle.head.item

module.exports = josephus
