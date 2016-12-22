letterChanges = require('../algorithms/letterChanges.coffee')
expect = require('chai').expect

module.exports = ->
  it 'should return "AshvnfOU hpft Ifsf" for "Argument goes here"', ->
    expect(letterChanges('Argument goes here')).to.equal('AshvnfOU hpft Ifsf')
  it 'should return "aZya!@.2" for "zZxz!@.2"', ->
    expect(letterChanges('zZxz!@.2')).to.equal('aZya!@.2')