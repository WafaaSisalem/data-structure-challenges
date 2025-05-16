import 'package:data_structure_challenges/linkedlist.dart';

void main() {
  // Challenge 1: Print in Reverse
  // Create a function that prints the nodes of a linked list in reverse order.

  // Challenge 2: Find the Middle Node
  // Create a function that finds the middle node of a linked list.

  // Challenge 3: Reverse a Linked List
  // Create a function that reverses a linked list. You do this by manipulating the nodes so that they’re linked in the other direction.

  // Challenge 4: Remove All Occurrences
  // Create a function that removes all occurrences of a specific element from a linked list. The implementation is similar to the removeAfter method that you implemented earlier.

  firstChallenge();
  print('_________________________________');
  secondChallenge();
  print('_________________________________');
  thirdChallenge();
  print('_________________________________');
  fourthChallenge();
}

void printInReverse(LinkedList list) {
  printNodesRecursively(list.head);
}

void printNodesRecursively<T>(Node<T>? node) {
  if (node == null) return;
  printNodesRecursively(node.next);
  print(node.value);
}

void firstChallenge() {
  print('first challenge: print in reverse');
  LinkedList list = LinkedList();
  list.push('3');
  list.push('2');
  list.push('1');
  print('given list $list');
  //the list is [1,2,3]
  //it will be [3,2,1]
  print('result:');
  printInReverse(list);
}

void secondChallenge() {
  print('second challenge: get the middle node in a linked list');
  LinkedList list = LinkedList();
  list.push(7);
  list.push(6);
  list.push(5);
  list.push(4);
  list.push(3);
  list.push(2);
  list.push(1);
  print('given list $list');
  Node? middleNode = getMiddle(list);
  print('Result: ${middleNode?.value}');
}

Node<E>? getMiddle<E>(LinkedList<E> list) {
  //this is my solution
  int length = list.length;
  int middleIndex = (length / 2).floor();
  return list.nodeAt(middleIndex);

  //I checked the book solution and understood it
  // var slow = list.head;
  // var fast = list.head;

  // while (fast?.next != null) {
  //   fast = fast?.next?.next;
  //   slow = slow?.next;
  // }

  // return slow;
}

void thirdChallenge() {
  print('third challenge: Reverse a linked list');
  LinkedList list = LinkedList();

  list.push(3);
  list.push(2);
  list.push(1);
  print('given list $list');
  reverseList(list);
}

void reverseList(LinkedList list) {
  list.tail = list.head;
  var previous = list.head;
  var current = list.head?.next;
  previous?.next = null;

  while (current != null) {
    final next = current.next;
    current.next = previous;
    previous = current;
    current = next;
  }

  list.head = previous;
  print('after reverse $list');
}

void fourthChallenge() {
  print('fourth challenge: Remove all oc');
  var list = LinkedList<int>();
  list.push(7);
  list.push(6);
  list.push(6);
  list.push(2);
  list.push(1);
  print('given list $list');
  removeAll(list, 6);

  print('after removing all oc $list');
}

void removeAll(LinkedList list, value) {
  while (list.head != null && list.head!.value == value) {
    list.head = list.head!.next;
  }
  var previous = list.head;
  var current = list.head?.next;
  while (current != null) {
    if (current.value == value) {
      previous?.next = current.next;
      current = previous?.next;
      continue;
    }
    previous = current;
    current = current.next;
  }
  list.tail = previous;
}
