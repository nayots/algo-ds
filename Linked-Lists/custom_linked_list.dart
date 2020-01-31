main(List<String> args) {
  MyLinkedList<int> myList = MyLinkedList(1);
  myList.append(5);
  myList.append(16);
  myList.append(17);
  myList.append(18);
  myList.append(19);

  var currentNode = myList.head;
  while (currentNode != null) {
    print(currentNode.value);
    currentNode = currentNode.next;
  }
  print(myList.length);
}

class MyLinkedList<T> {
  MyLinkedListNode<T> head;
  MyLinkedListNode<T> tail;
  int length;
  MyLinkedList(T value) {
    head = MyLinkedListNode(value);
    tail = null;
    length = 1;
  }

  void append(T value) {
    MyLinkedListNode<T> val = MyLinkedListNode<T>(value);
    if (length == 1) {
      head.next = val;
      tail = val;
    } else {
      tail.next = val;
      tail = val;
    }
    length++;
  }
}

class MyLinkedListNode<T> {
  T value;
  MyLinkedListNode next;

  MyLinkedListNode(T val) {
    value = val;
    next = null;
  }
}
