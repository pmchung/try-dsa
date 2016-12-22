expect = require('chai').expect
skyline = require('../algorithms/skyline.coffee')

module.exports = ->
  it 'should return ' + JSON.stringify([ [2, 9, 10], [3, 7, 15], [5, 12, 12], [15, 20, 10], [19, 24, 8] ]), ->
    skylineA = [ [2, 9, 10], [3, 7, 15], [5, 12, 12], [15, 20, 10], [19, 24, 8] ]
    skylineB = [ [2, 10], [3, 15], [7, 12], [12, 0], [15, 10], [20, 8], [24, 0] ]
    expect(skyline(skylineA)).to.deep.equal(skylineB)