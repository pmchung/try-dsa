###
  Given a square matrix of size , calculate the absolute
  difference between the sums of its diagonals.
###

diagonalDiff = (matrix) ->
  topLeftToBottomRight = 0
  topRightToBottomLeft = 0
  for height, index in matrix
    topLeftToBottomRight += height[index]
    topRightToBottomLeft += height[height.length - (index + 1)]
  Math.abs topLeftToBottomRight - topRightToBottomLeft
  
module.exports = diagonalDiff