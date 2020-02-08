main(List<String> args) {
  MyQueue myQueue = MyQueue();
  myQueue.enqueue(1).enqueue(2).enqueue(3);
  print(myQueue);
  print(myQueue.peek());
  myQueue.dequeue();
  myQueue.dequeue();
  print(myQueue);
}

class Node {
  dynamic value;
  Node next;
  Node(val) {
    value = val;
    next = null;
  }

  @override
  String toString() {
    return value?.toString();
  }
}

class MyQueue {
  Node first = null;
  Node last = null;
  int length = 0;

  Node peek() {
    return first;
  }

  MyQueue enqueue(dynamic value) {
    Node newNode = Node(value);
    if (length == 0) {
      first = newNode;
      last = newNode;
    } else {
      last.next = newNode;
      last = newNode;
    }
    length++;
    return this;
  }

  Node dequeue() {
    if (first == null) {
      return null;
    }
    Node holder = first;
    if (first == last) {
      last = null;
    }
    first = holder.next;
    length--;
    return holder;
  }

  @override
  String toString() {
    Node currentNode = first;
    StringBuffer sb = StringBuffer();
    sb.write('Length: $length | ');
    sb.write('Start: ( ');
    while (currentNode != null) {
      sb.write('${currentNode.value} ');
      currentNode = currentNode.next;
    }
    sb.write(') End');

    return sb.toString();
  }
}
