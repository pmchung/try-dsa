#Data Structures & Algorithms

###Arrays
- Resizes 2x when limit is reached
- o(1), good for random access, with a known length -> access operation can be done by add/sub
- o(n) search, insertion & deletion (need to move items)

###Linked Lists
- Memory efficient (no need to pre alloc)
- o(1) insertion operation by changing reference, no need to move other items
 - Inserting at a certain index still requires o(n) (searching)
- Random access is o(n) due to need for traversal to the correct index
- Can implement
 - Queue (FIFO)
 - Stack (LIFO)
 - Usage
  - http://stackoverflow.com/questions/30949981/would-you-ever-implement-a-linked-list-in-javascript
  - Circular http://stackoverflow.com/questions/3589772/why-exactly-do-we-need-a-circular-linked-list-singly-or-doubly-data-structur 
 
###Binary Tree
- Single root node
 - Children
  - Left node
  - Right node
- Usage over hash table
 - http://cs.stackexchange.com/questions/30347/when-are-binary-trees-better-than-hashtables-in-real-world-applications
####Binary Search Tree
- Good for range searches, min/max
- Needs to be balanced (kept same height) for efficiency or else o(n)
- o(log n) search, access
- o(1) insert/delete since changing reference but to do this we must access so it's o(log n) in the end
- Ordered nodes
 - Left node less than parent node
 - Right node more than parent node

