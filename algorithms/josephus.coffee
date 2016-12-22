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

CircularLList = require('../data-structures/CircularLList.coffee')

josephus = (num = 0, k) ->
  if num < 1
    return 0
  Circle = new CircularLList()
  Circle.append(i) for i in [1..num] # set up the soldiers
  soldier = Circle.step(Circle.head, k - 1) # starting at 1 so step by k-1
  while Circle.length > 1
    Circle.remove(soldier) # kill this soldier
    soldier = Circle.step(soldier, k) # go to soldier 2 steps from current dead soldier
  Circle.head.item

module.exports = josephus
