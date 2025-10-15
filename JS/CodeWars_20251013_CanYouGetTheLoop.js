function loop_size(node){
  // to check if the list is empty or has only one node => no loop is possible.
  if(!node || !node.next){
    return 0;
  }
  
  let slow = node;
  let fast = node;
  let cycleLength=1;
  let meeting;
  
  while(fast!=null && fast.next!=null){
        slow = slow.next; // one step
        fast = fast.next.next; // two steps
    
        if(slow === fast){ // The point they will meet at will be the starting point of the cycle.
            meeting = slow;
          if (meeting === null){ // To confirm that, if meetingPoint is null, the loop finished because 'fast' hit null => no cycle, its already finished
              return 0;
          }
          break
        }
    }
  
    // Advance one step and count until we return to the meeting point
    if(meeting){
      let currentNode = meeting;
      let nextNode = meeting.next;
      
      while(nextNode!=meeting){
        cycleLength++;
        currentNode = currentNode.next;
        // Note: We check 'current.next' because we start counting *after* the first node.
        nextNode = currentNode.next
      }
      return cycleLength;
    }
}