josephus = require('../algorithm/josephus.coffee');
expect = require('chai').expect

module.exports = () -> 
  it('should return position 15 for 71 soldiers when 2 step', () ->
    expect(josephus(71, 2)).to.equal(15)
  )
  it('should return position 5 for 10 soldiers when 2 step', () ->
    expect(josephus(10, 2)).to.equal(5)
  )
  it('should return position 3111 for 32923 soldiers when 2 step', () ->
    expect(josephus(32923, 2)).to.equal(311)
  )
  it('return position 0 for 0 soldiers', () ->
    expect(josephus(0, 2)).to.equal(0)
  )
