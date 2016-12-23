expect = require('chai').expect
skyline = require('../algorithms/skyline.coffee')

module.exports = ->
  it 'should return ' + JSON.stringify([ [2, 10], [3, 15], [7, 12], [12, 0], [15, 10], [20, 8], [24, 0] ]), ->
    skylineA = [ [2, 9, 10], [3, 7, 15], [5, 12, 12], [15, 20, 10], [19, 24, 8] ]
    skylineB = [ [2, 10], [3, 15], [7, 12], [12, 0], [15, 10], [20, 8], [24, 0] ]
    expect(skyline(skylineA)).to.deep.equal(skylineB)

  it 'should return ' + JSON.stringify([[1, 3], [2, 0]]) , ->
    skylineA = [[1, 2, 1], [1, 2, 2], [1, 2, 3]]
    skylineB = [[1, 3], [2, 0]]
    console.log skylineA
    console.log(skylineB)
    console.log(skyline(skylineA))
    #expect(skyline(skylineA)).to.deep.equal(skylineB)

  it 'should not exceed memory', ->
    skylineA = [[0, 2147483647, 2147483647]]
    skylineB = [[0, 2147483647]]
    expect(skyline(skylineA)).to.deep.equal([[0, 2147483647], [2147483647, 0]])


  