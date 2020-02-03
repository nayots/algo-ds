main(List<String> args) {
  MyDoublyLinkedList<int> myList = MyDoublyLinkedList(1);
  myList.append(5);
  myList.append(16);
  myList.prepend(99);
  myList.prepend(89);
  myList.printList();
  myList.insert(1, 13);
  myList.insert(0, 16);
  myList.printList();
  myList.remove(6);
  myList.remove(2);
  myList.printList();
  // myList.reverse();
  myList.printList();
  myList.printList(verbose: true);
}

class MyDoublyLinkedList<T> {
  MyLinkedListNode<T> head;
  MyLinkedListNode<T> tail;
  int length;
  MyDoublyLinkedList(T value) {
    head = MyLinkedListNode(value);
    tail = head;
    length = 1;
  }

  MyDoublyLinkedList<T> append(T value) {
    MyLinkedListNode<T> val = MyLinkedListNode<T>(value);
    tail.next = val;
    val.prev = tail;
    tail = val;
    length++;

    return this;
  }

  MyDoublyLinkedList<T> prepend(T value) {
    MyLinkedListNode<T> val = MyLinkedListNode<T>(value);
    val.next = head;
    head.prev = val;
    head = val;
    length++;

    return this;
  }

  MyDoublyLinkedList<T> insert(int index, T value) {
    if (index == 0) {
      return prepend(value);
    }
    if (index >= length) {
      return append(value);
    }
    MyLinkedListNode<T> val = MyLinkedListNode<T>(value);
    MyLinkedListNode<T> leader = traverseToIndex(index - 1);
    MyLinkedListNode<T> follower = leader.next;
    val.next = follower;
    val.prev = leader;
    follower?.prev = val;
    leader.next = val;
    length++;

    return this;
  }

  MyDoublyLinkedList<T> remove(int index) {
    MyLinkedListNode<T> leader = traverseToIndex(index - 1);
    leader.next = leader.next.next;
    leader.next?.prev = leader;
    length--;

    return this;
  }

  MyLinkedListNode<T> traverseToIndex(index) {
    int currentIndex = 0;
    MyLinkedListNode<T> currentNode = head;
    while (currentNode != null) {
      if (currentIndex == index) {
        break;
      }
      currentIndex++;
      currentNode = currentNode.next;
    }

    return currentNode;
  }

  // MyDoublyLinkedList<T> reverse() {
  //   if (head.next == null) {
  //     return this;
  //   }
  //   MyLinkedListNode<T> first = head;
  //   tail = head;
  //   MyLinkedListNode<T> second = first.next;
  //   while (second != null) {
  //     MyLinkedListNode<T> temp = second.next;
  //     second.next = first;
  //     first = second;
  //     second = temp;
  //   }

  //   head.next = null;
  //   head = first;
  //   return this;
  // }

  void printList({bool verbose = false}) {
    List<String> data = List<String>();
    var currentNode = head;
    while (currentNode != null) {
      if (!verbose) {
        data.add(currentNode.value?.toString());
      } else {
        data.add(
            '(${currentNode?.prev?.value} -> ${currentNode.value} -> ${currentNode.next?.value})');
      }
      currentNode = currentNode.next;
    }
    print(data);
  }
}

class MyLinkedListNode<T> {
  T value;
  MyLinkedListNode prev;
  MyLinkedListNode next;

  MyLinkedListNode(T val) {
    value = val;
    next = null;
    prev = null;
  }
}
