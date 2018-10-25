class Node:

	def __init__(self, data = None, next = None):
		self.data = data
		self.next = next

	def get_data(self):
		return self.data

	def get_next_node(self):
		return self.next


# A singly linked list is a data structure that consists of nodes that store 
# some form of data and a reference to the next node.
# The difference between an array and a singly linked list is that accessing
# an element in an array is constant(array[1] to get the second element) where
# as a singly linked list takes linear time since the list needs to be traversed.
# Advantage: Deletion and insertion can be quick(constant)
class SinglyLinkedList:
	def __init__(self, head = None):
		self.head = head
	
	# Prepend the node at the beginning of the list
	# Time complexity: O(1)
	# We only need to change the pointer of the node that is inserted
	# and assign head to the new node
	def prepend(self, node):
		node.next = self.head
		self.head = node

	# Append the node at the end of the list
	# Time complexity: O(n)
	# It is neccessary to traverse whole list
	def append(self, node):
		if self.head == None:
			self.head = node
		else:
			n = self.head
			while n.next != None:
				n = n.next
			n.next = node

	# Find
	# Time complexity: O(n)
	def find_node(self, n):
		node = self.head
		while node.data != n:
			if node == None:
				return None
			node = node.next

		return node

	# Delete node n by changing the reference of the node before n
	# to the successor of n
	# 
	def remove(self, n):
		node = self.head
		if node.data == n:
			self.head = node.next
			return
			
		while node.next != None:
			if node.next.data == n:
				node.next = node.next.next
			else:
				node = node.next

	def print_list(self):
		node = self.head
		while node != None:
			print(node.data)
			node = node.next

head = Node(1, None)
singlyLinkedList = SinglyLinkedList(head)
singlyLinkedList.prepend(Node(2, None))
singlyLinkedList.prepend(Node(7, None))
singlyLinkedList.remove(2)
singlyLinkedList.prepend(Node(8, None))
singlyLinkedList.remove(1)
singlyLinkedList.prepend(Node(12, None))
singlyLinkedList.append(Node(1, None))
singlyLinkedList.remove(7)
singlyLinkedList.remove(12)
singlyLinkedList.print_list()
