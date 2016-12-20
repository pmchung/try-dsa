josephus = require('../algorithm/josephus.coffee')
expect = require('chai').expect

module.exports = ->
  it 'should return position 15 for 71 soldiers when 2 step', ->
    expect(josephus(71, 2)).to.equal(15)

  it 'should return position 311 for 32923 soldiers when 2 step', ->
    expect(josephus(32923, 2)).to.equal(311)
  
  it 'should return position 14 for 2 soldiers when 3 step', ->
    expect(josephus(14, 3)).to.equal(2)
  
  it 'should return position 15 for 45 soldiers when 6 step', ->
    expect(josephus(45, 6)).to.equal(15)
  
  it 'should return position 0 for 0 soldiers', ->
    expect(josephus(0, 2)).to.equal(0)
  
  it 'should return position 0 for null soldiers', ->
    expect(josephus(null, 2)).to.equal(0)
  