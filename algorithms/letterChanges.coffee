###
  Have the function letterChanges(str) take the str parameter being
  passed and modify it using the following algorithm. Replace every
  letter in the string with the letter following it in the alphabet (ie.
  c becomes d, z becomes a). Then capitalize every vowel in this new
  string (a, e, i, o, u) and finally return this modified string.
###

letterChanges = (str) ->
  vowels = ['a', 'e', 'i', 'o', 'u']
  newString = str.split('').map (item) ->
    c = item.charCodeAt(0)
    c = if 122 > c >= 97 then c + 1 else if c == 122 then 97 else c
    letter = String.fromCharCode(c)
    return if vowels.indexOf(letter) > 0 then letter.toUpperCase() else letter
  newString.join('')


module.exports = letterChanges
