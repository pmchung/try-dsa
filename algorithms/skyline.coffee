###
  https://leetcode.com/problems/the-skyline-problem/
  @param {number[][]} buildings
  @return {number[][]}
  [start, end, height]
  input  = [ [2, 9, 10], [3, 7, 15], [5, 12, 12], [15, 20, 10], [19, 24, 8] ]
  output = [ [2, 10], [3, 15], [7, 12], [12, 0], [15, 10], [20, 8], [24, 0] ]
###

###
  3. Merge buildings?
###

skyline = (buildings) ->
  # shape of a building inside merge[]
  # [index, start, end, height]
  merged = [{}]
  for building, index in buildings
    merged = merged.filter (item) -> # find building to merge
       return

 

###
  2. Naive implementation
  Won't work for later buildings that overlaps an earlier building in the list

skyline = (buildings) ->
  currentHeight = 0
  currentEnd = 0
  points = []
  for building, index in buildings
    [start, end, height] = building
    if index == 0
      points.push [start, height]
      currentHeight = height
      currentEnd = end
    else
      if height != currentHeight # differ height
        if height > currentHeight && currentEnd > end # just taller
          points.push [start, height]
          currentHeight = height
        if end > currentEnd # current end is not shadowed
          if start > currentEnd # start is also not shadowed
            points.push [buildings[index - 1][1], 0]
            points.push [start, height] # new building!
            currentHeight = height
            currentEnd = end
          else # start is shadowed, but end is not
            points.push [
              if buildings[index - 1][1] > start
              then buildings[index - 1][1]
              else start,
              height
            ]
    if index == buildings.length - 1
      points.push [end, 0]
  points
 ###

###
  1. Brute force
  Not enough memoy for large sets when plotting a huge array

skyline = (buildings) ->
  currentHeight = 0
  mapHeight = []
  points = []

  for building in buildings
    [start, end, height] = building
    for i in [start...end]
      if mapHeight[i-1] != mapHeight[i]
        mapHeight[i] = if mapHeight[i] && mapHeight[i] > height then mapHeight[i] else height
  mapHeight.push(0)

  for height, index in mapHeight
    height = if !height? then 0 else height
    if height != currentHeight
      points.push [index, height]
    currentHeight = height
  points
###

module.exports = skyline






