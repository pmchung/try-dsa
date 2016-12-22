###
  https://leetcode.com/problems/the-skyline-problem/
  @param {number[][]} buildings
  @return {number[][]}
  [start, end, height]
  input  = [ [2, 9, 10], [3, 7, 15], [5, 12, 12], [15, 20, 10], [19, 24, 8] ]
  output = [ [2, 10], [3, 15], [7, 12], [12, 0], [15, 10], [20, 8], [24, 0] ]
###
            
skyline = (buildings) ->
  currentHeight = 0
  mapHeight = []
  points = []

  for building in buildings
    [start, end, height] = building
    for i in [start...end]
      mapHeight[i] = if mapHeight[i] && mapHeight[i] > height then mapHeight[i] else height
  mapHeight.push(0)

  for height, index in mapHeight
    height = if !height? then 0 else height
    if height != currentHeight
      points.push [index, height]
    currentHeight = height
  points

module.exports = skyline






