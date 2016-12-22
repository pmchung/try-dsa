expect = require('chai').expect
diagonalDiff = require('../algorithms/diagonalDiff.coffee')

module.exports = ->
  it 'should return 15', ->
    matrix = [
      [11, 2, 4]
      [4, 5, 6]
      [10, 8, -12]
    ]
    expect(diagonalDiff(matrix)).to.equal(15)
    
  it 'should return 0', ->
    matrix = [
      [1, 2, 3, 4, 5, 6]
      [1, 2, 3, 4, 5, 6]
      [1, 2, 3, 4, 5, 6]
      [1, 2, 3, 4, 5, 6]
      [1, 2, 3, 4, 5, 6]
      [1, 2, 3, 4, 5, 6]
    ]
    expect(diagonalDiff(matrix)).to.equal(0)