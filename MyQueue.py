#
# Queue implementation with 2 Stacks
# A queue is a list where items are added and
# removed from opposite sites
#
# A queue implements following operations:
# 
# add(item): Add an item to the end of the list
# remove(): Remove the first item in the list
# peek(): Return top of the queue
# isEmpty(): Return true iff the queue is empty

class MyQueue:

    # This stack stores the new incoming values
    stack_newest = []

    # This stack has the popped values from the newest stack.
    # The elements are in the order of a FIFO Queue ready to be dequeued.
    stack_oldest = []

    # This function pushes the contents of stack1 to stack2
    # therefore reversing the order.
    def push_elements_to_stack(self, stack_newest, stack_oldest):
        while stack_newest:
            stack_oldest.append(stack_newest.pop())

    # Append the item at the end of the list
    def add(self, item):
        self.stack_newest.append(item)

    # Lazy approach:
    # If the stack_oldest still has elements that means that these elements
    # need to be removed and dequeued first.
    # If this stack is empty then we need to push all the elements from
    # newest_stack to the oldest_stack to reverse the order and have
    # the oldest one at the top of the stack.
    def remove(self):
        # If the second stack has items, those need to be retrieved first
        # since they are the first one in the queue
        if self.stack_oldest:
            return self.stack_oldest.pop()
        
        # Both stacks are empty
        if not self.stack_newest:
            return -1

        self.push_elements_to_stack(self.stack_newest, self.stack_oldest)
        return self.stack_oldest.pop()

    # Similar to remove but we need to push the element on the oldest_stack again.
    def peek(self):
        if not self.stack_oldest:
            self.push_elements_to_stack(self.stack_newest, self.stack_oldest)

        elem = self.stack_oldest.pop()
        self.stack_oldest.append(elem)
        return elem

    # Queue is empty iff both stacks are empty.
    def isEmpty(self):
        return not self.stack_oldest and not self.stack_newest

myQueue = MyQueue()
myQueue.add(3)
myQueue.add(2)
myQueue.add(6)
myQueue.add(1)

print(myQueue.remove())
print(myQueue.remove())
myQueue.add(10)
print(myQueue.remove())
myQueue.add(12)
myQueue.add(20)
print(myQueue.remove())
print(myQueue.remove())
print(myQueue.remove())
print(myQueue.remove())
