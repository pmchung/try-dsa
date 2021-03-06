expect = require('chai').expect
getSkyline = require('../algorithms/skyline.coffee')

module.exports = ->
  it 'Test 1', ->
    skylineA = [ [2, 9, 10], [3, 7, 15], [5, 12, 12], [15, 20, 10], [19, 24, 8] ]
    skylineB = [ [2, 10], [3, 15], [7, 12], [12, 0], [15, 10], [20, 8], [24, 0] ]
    expect(getSkyline(skylineA)).to.deep.equal(skylineB)

  it 'Test 2', ->
    skylineA = [[1, 2, 1], [1, 2, 2], [1, 2, 3]]
    skylineB = [[1, 3], [2, 0]]
    expect(getSkyline(skylineA)).to.deep.equal(skylineB)


  it 'Test 3', ->
    skylineA = [[0, 2, 3], [2, 5, 3]]
    skylineB = [[0, 3], [5, 0]]
    expect(getSkyline(skylineA)).to.deep.equal(skylineB)


  it 'Test 4', ->
    skylineA = [[2, 13, 10], [10, 17, 25], [12, 20, 14]]
    skylineB = [[2, 10], [10, 25], [17, 14], [20, 0]]
    expect(getSkyline(skylineA)).to.deep.equal(skylineB)


  it 'Test 5', ->
    skylineA = [[0, 3, 3], [1, 5, 3], [2, 4, 3], [3, 7, 3]]
    skylineB = [[0, 3], [7, 0]]
    expect(getSkyline(skylineA)).to.deep.equal(skylineB)

  it 'Test 6', ->
    skylineA = [[2, 4, 70], [3, 8, 30], [6, 100, 41], [7, 15, 70], [10, 30, 102], [15, 25, 76], [60, 80, 91], [70, 90, 72], [85, 120, 59]]
    skylineB = [[2, 70], [4, 30], [6, 41], [7, 70], [10, 102], [30, 41], [60, 91], [80, 72], [90, 59], [120, 0]]
    expect(getSkyline(skylineA)).to.deep.equal(skylineB)

  it 'Test 7', ->
    skylineA = [[1, 5, 3], [1, 5, 3], [1, 5, 3]]
    skylineB = [[1, 3], [5, 0]]
    expect(getSkyline(skylineA)).to.deep.equal(skylineB)
 

  it 'Test 8', ->
    skylineA = [[2, 4, 7], [2, 4, 5], [2, 4, 6]]
    skylineB = [[2, 7], [4, 0]]
    expect(getSkyline(skylineA)).to.deep.equal(skylineB)

  it 'Test 9', ->
    skylineA = [[1, 2, 1], [1, 2, 2], [1, 2, 3]]
    skylineB = [[1, 3], [2, 0]]
    expect(getSkyline(skylineA)).to.deep.equal(skylineB)


  it 'Test 10', ->
    skylineA = [[0, 5, 7], [5, 10, 7], [5, 10, 12], [10, 15, 7], [15, 20, 7], [15, 20, 12], [20, 25, 7]]
    skylineB = [[0, 7], [5, 12], [10, 7], [15, 12], [20, 7], [25, 0]]
    expect(getSkyline(skylineA)).to.deep.equal(skylineB)

  it 'Test 11', ->
    skylineA = [[6765, 184288, 53874], [13769, 607194, 451649], [43325, 568099, 982005], [47356, 933141, 123943], [59810, 561434, 119381], [75382, 594625, 738524], [111895, 617442, 587304], [143767, 869128, 471633], [195676, 285251, 107127], [218793, 772827, 229219], [316837, 802148, 899966], [329669, 790525, 416754], [364886, 882642, 535852], [368825, 651379, 6209], [382318, 992082, 300642], [397203, 478094, 436894], [436174, 442141, 612149], [502967, 704582, 918199], [503084, 561197, 625737], [533311, 958802, 705998], [565945, 674881, 149834], [615397, 704261, 746064], [624917, 909316, 831007], [788731, 924868, 633726], [791965, 912123, 438310]]
    skylineB = [[6765, 53874], [13769, 451649], [43325, 982005], [568099, 918199], [704582, 899966], [802148, 831007], [909316, 705998], [958802, 300642], [992082, 0]]
    expect(getSkyline(skylineA)).to.deep.equal(skylineB)


  it 'should not exceed memory', ->
    skylineA = [[0, 2147483647, 2147483647]]
    skylineB = [[0, 2147483647]]
    expect(getSkyline(skylineA)).to.deep.equal([[0, 2147483647], [2147483647, 0]])
