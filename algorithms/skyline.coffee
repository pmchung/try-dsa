###
  https://leetcode.com/problems/the-skyline-problem/
  @param {number[][]} buildings
  @return {number[][]}
  [start, end, height]
  input  = [ [2, 9, 10], [3, 7, 15], [5, 12, 12], [15, 20, 10], [19, 24, 8] ]
  output = [ [2, 10], [3, 15], [7, 12], [12, 0], [15, 10], [20, 8], [24, 0] ]
###

###
  Working final
  4b.  Map every start XY and end XY & filter out each individual point if meet criteria
      200~ms by pre-filtering the points & breaking early
###
class StartPoint
  constructor: (@x = 0, @y = 0, @show = true) ->
    return
class EndPoint
  constructor: (@x = 0, @y = 0, @show = true) ->
    @floor = 0

getSkyline = (buildings) ->
  # plot building points
  points = []
  dupeStart = {}
  dupeEnd = {}
  # Break up building XYs into separate start/end points
  # also pre-filter any duplicates as we go
  for [start, end, height] in buildings
    # Only keep points that are higher than existing one of same X position
    if !dupeStart[start]
      points.push dupeStart[start] = new StartPoint(start, height)
    else if height > dupeStart[start].y
      dupeStart[start].y = height

    # Separate check because EndPoint should not be removed by the existence of another StartPoint
    # Need to keep EndPoint around for descends
    if !dupeEnd[end]
      points.push dupeEnd[end] = new EndPoint(end, height)
    else if height > dupeEnd[end].y
      dupeEnd[end].y = height

  points = points.sort (a, b) ->
    return if a.x > b.x then 1 else -1
    0

  results = for point in points
    type = point.constructor.name
    # Each point has to go through every building to check for removal unless it meets removal criteria
    for [start, end, height] in buildings
      # Removal criteria
      #   If point is shadowed by another building
      #   If StartPoint overlaps the end of another building of same height (merge)
      #   If EndPoint overlaps the start of another building of same height (merge)
      if start < point.x < end && height >= point.y or
      type is 'StartPoint' && end == point.x && height == point.y or
      type is 'EndPoint' && start == point.x && height == point.y
        point.show = false
        break

      # Lower EndPoint to next highest height available
      if type is 'EndPoint' && start <= point.x <= end
        # Make sure we always go higher if available but never over ceiling
        if point.y > height > point.floor
          point.floor = height

    continue if !point.show
    if point.floor?
      [point.x, point.floor]
    else
      [point.x, point.y]

  results[results.length - 1]?[1] = 0
  results


###
  Semi-working
  4a. Map every start XY and end XY & filter out each individual point if meet criteria
    
    Time limit exceed without breaks
    1400~ms with early breaks
 
class StartPoint
  constructor: (@x = 0, @y = 0, @parent = 0, @show = true) ->
    return
class EndPoint
  constructor: (@x = 0, @y = 0, @parent = 0, @show = true) ->
    @floor = 0

getSkyline = (buildings) ->
  # plot building points
  points = []
  dupe = {}
  for [start, end, height], index in buildings
    points.push new StartPoint(start, height, index), new EndPoint(end, height, index)

  points = points.sort (a, b) ->
    return if a.x > b.x then 1 else -1
    0

  for point in points
    type = point.constructor.name
    # Only keep points that are higher if same X position
    if dupe[point.x]?
      if dupe[point.x].y < point.y
        dupe[point.x].show = false
        dupe[point.x] = point
      else
        point.show = false
        continue
    else
      dupe[point.x] = point

    for [start, end, height], index in buildings
      # Criteria 1
      # Remove if point is shadowed by another building
      if start < point.x < end
        if height >= point.y
          point.show = false
          break
      # Criteria 2
      if type is 'StartPoint'
        # Remove if start point is overlapping the end of another building of the height
        if end == point.x && height == point.y
          point.show = false
          break
      # Criteria 3
      if type is 'EndPoint'
        # A
        # aRemove if end point is overlapping the start of another building of the height
        if start == point.x && height == point.y
          point.show = false
          break
        # B
        # Descend end point's height to the next highest building it shadows
        else if start <= point.x <= end
          if point.y > height > point.floor
            point.floor = height
 
  points = points.filter((i) -> (i.show))
  points.map (p, index) ->
    if p.floor?
      p.floor = 0 if index == points.length - 1
      return [p.x, p.floor]
    else
      return [p.x, p.y]

###

###
  Not working
  3. Collapse the width?
  Will have to add remaining width after and it gets crazy/need to re-sort every time
 
skyline = (buildings) ->
  # [start, end, height]
  merged = []
 
  for building, index in buildings # o(n)
    [start, end, height] = building
    flag = false
    append = null
    # go through past buildings and chunk off current
    # or chunk old ones if current one overshadows it
    for mergedB, mIndex in merged
      [mStart, mEnd, mHeight] = mergedB
      # check if current building touches anything in merged building
      if mStart <= start <= mEnd  # start overlaps
        if (mHeight >= height) # current is lower or equal height
          if mEnd >= end # current is shorter or equal
            flag = true
          if mHeight == height && end > mEnd # equal height & longer, extend the merge
            merged[mIndex][1] = end
            flag = true
        if (height > mHeight) # current shadows it, chunk old building instead
          if mEnd > end # current is shorter, merged tail chunk needs to be appended...
            append = [end, mEnd, mHeight]

          merged[mIndex][1] = start
          merged[mIndex][3] = if (end >= mEnd && mStart >= start) then true else false # completely shadowed, set flag to skip later
        else # being shadowed, will have to chunk current
          start = mEnd
     merged.push [start, end, height, flag]
     merged.push append if append?

  withDescend = []

  merged = merged.filter (item) -> !item[3]
  merged.forEach (item, index) ->
    withDescend.push [item[0], item[2]]
    withDescend.push [item[1], 0] if merged[index + 1]?[0] > (item[1] + 1) || index == merged.length - 1
  withDescend

###

###
  Not working
  2. Check previous neighbour
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
  Semi-working?
  1. Plot width in array
  Not enough memoy for large sets when plotting a huge array

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
###

module.exports = getSkyline






