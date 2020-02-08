main(List<String> args) {
  Stack myStack = Stack();
  myStack.push(1);
  myStack.push(2);
  myStack.push(3);
  print(myStack);
  print(myStack.peek());
  print(myStack.pop());
  print(myStack);
  print(myStack.pop());
  print(myStack.pop());
  print(myStack);

  StackWithList myStackWithList = StackWithList();
  myStackWithList.push(1);
  myStackWithList.push(2);
  myStackWithList.push(3);
  print(myStackWithList);
  print(myStackWithList.peek());
  print(myStackWithList.pop());
  print(myStackWithList);
  print(myStackWithList.pop());
  print(myStackWithList.pop());
  print(myStackWithList);
}

class Stack {
  Node top;
  Node bottom;
  int _length;
  Stack() {
    top = null;
    bottom = null;
    _length = 0;
  }

  Node peek() {
    return top;
  }

  push(dynamic value) {
    Node newNode = Node(value);
    if (_length == 0) {
      top = newNode;
      bottom = newNode;
    } else {
      Node holdingPointer = top;
      top = newNode;
      top.next = holdingPointer;
    }
    _length++;
    return this;
  }

  Node pop() {
    if (top == null) {
      return null;
    }
    if (top == bottom) {
      bottom = null;
    }
    Node holdingPointer = top;
    top = top.next;
    _length--;

    return holdingPointer;
  }

  bool isEmpty() {
    return _length == 0;
  }

  @override
  String toString() {
    Node currentNode = top;
    StringBuffer sb = StringBuffer();
    while (currentNode != null) {
      sb.writeln('=> ${currentNode.value}');
      currentNode = currentNode.next;
    }

    return sb.toString();
  }
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

class StackWithList {
  List<dynamic> data;
  StackWithList() {
    data = [];
  }

  dynamic peek() {
    return data.last;
  }

  push(dynamic value) {
    data.add(value);
    return this;
  }

  dynamic pop() {
    return data.removeLast();
  }

  bool isEmpty() {
    return data.isEmpty;
  }

  @override
  String toString() {
    StringBuffer sb = StringBuffer();
    for (var i = data.length - 1; i >= 0; i--) {
      sb.writeln('=> ${data[i]}');
    }

    return sb.toString();
  }
}
