expect = require('chai').expect
CircularLList = require('../data-struct/CircularLList.coffee');

module.exports = () -> 
  describe('get(index)', () ->
    it('should return node at index', () ->
      Circle = new CircularLList()
      Circle.append(1)
      Circle.append(2)
      Circle.append(3)
      expect(Circle.get(2).item).to.equal(3)
    )
    it('should return null if empty list', () ->
      Circle = new CircularLList()
      expect(Circle.get(4)).to.equal(null)
    )
    it('should cycle if index > length', () ->
      Circle = new CircularLList()
      Circle.append(1) #0
      Circle.append(2) #1
      Circle.append(3) #2
      expect(Circle.get(4).item).to.equal(2)
    )
  )

  describe('append(item)', () ->
    it('should insert new node at the end', () ->
      Circle = new CircularLList();
      Circle.append(1)
      Circle.append(2)
      expect(Circle.get(Circle.length - 1).item).to.equal(2)
    ) 
    it('should return new length', () ->
      Circle = new CircularLList()
      Circle.append(1)
      Circle.append(2)
      Circle.append(3)
      Circle.append(4)
      oldLength = Circle.length
      expect(Circle.append(5)).to.equal(oldLength + 1)
    )
  )
  describe('removeAt(index)', () ->
    it('should remove node at index', () ->
      Circle = new CircularLList()

      Circle.append(1) # 0
      Circle.append(2) # 1
      Circle.append(3) # 2
      Circle.append(4) # 3
      Circle.removeAt(0) # 2, 3, 4
      expect(Circle.get(3).item).to.equal(2)
      Circle.removeAt(0) # 3, 4
      expect(Circle.get(0).item).to.equal(3)
      Circle.removeAt(3) # 3
      expect(Circle.get(0).item).to.equal(3)
    ) 
    it('should return new length', () ->
      Circle = new CircularLList()
      Circle.append(1)
      Circle.append(2)
      Circle.append(3)
      Circle.append(4)
      oldLength = Circle.length
      Circle.removeAt(5)
      newLength = Circle.length
      expect(newLength).to.equal(oldLength - 1)
    )
    it('should return null for head if removing last node in list', () ->
      Circle = new CircularLList()
      Circle.append(1)
      Circle.append(2)
      Circle.removeAt(0)
      Circle.removeAt(0)
      expect(Circle.head).to.equal(null)
    )
  )
