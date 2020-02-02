main(List<String> args) {
  MyLinkedList<int> myList = MyLinkedList(1);
  myList.append(5);
  myList.append(16);
  myList.append(19).append(10);
  myList.prepend(99);
  myList.prepend(89);
  myList.printList();
  myList.insert(1, 13);
  myList.insert(0, 16);
  myList.printList();
  myList.remove(8);
  myList.printList();
}

class MyLinkedList<T> {
  MyLinkedListNode<T> head;
  MyLinkedListNode<T> tail;
  int length;
  MyLinkedList(T value) {
    head = MyLinkedListNode(value);
    tail = head;
    length = 1;
  }

  MyLinkedList<T> append(T value) {
    MyLinkedListNode<T> val = MyLinkedListNode<T>(value);
    tail.next = val;
    tail = val;
    length++;

    return this;
  }

  MyLinkedList<T> prepend(T value) {
    MyLinkedListNode<T> val = MyLinkedListNode<T>(value);
    val.next = head;
    head = val;
    length++;

    return this;
  }

  MyLinkedList<T> insert(int index, T value) {
    if (index == 0) {
      return prepend(value);
    }
    if (index >= length) {
      return append(value);
    }
    MyLinkedListNode<T> val = MyLinkedListNode<T>(value);
    MyLinkedListNode<T> leader = traverseToIndex(index - 1);
    val.next = leader.next;
    leader.next = val;
    length++;

    return this;
  }

  MyLinkedList<T> remove(int index) {
    MyLinkedListNode<T> leader = traverseToIndex(index - 1);
    leader.next = leader.next.next;
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

  void printList() {
    List<T> data = List<T>();
    var currentNode = head;
    while (currentNode != null) {
      data.add(currentNode.value);
      currentNode = currentNode.next;
    }
    print(data);
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
