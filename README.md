#Data Structures & Algorithms

###Arrays
- Resizes 2x when limit is reached
- o(1), good for random access, with a known length -> access operation can be done by add/sub

###Linked Lists
- Memory efficient (no need to pre alloc)
- o(1) insertion operation by changing reference, no need to move other items
 - inserting at a certain index still requires o(n) (searching)
- Poor random access is o(n) due to need for traversal to the correct index
- Can implement
 - Queue(fifo)
 - Stack(lifo)
 
 
