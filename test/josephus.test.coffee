josephus = require('../algorithm/josephus.coffee');
expect = require('chai').expect

module.exports = () -> 
  it('should return position 15 for 71 soldiers', () ->
    expect(josephus(71)).to.equal(15)
  )
  it('should return position 5 for 10 soldiers', () ->
    expect(josephus(10)).to.equal(5)
  )
  it('should return position 15 for 71 soldiers', () ->
    expect(josephus(32923)).to.equal(311)
  )
  it('return position 0 for 0 soldiers', () ->
    expect(josephus(0)).to.equal(0)
  )