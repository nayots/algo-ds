main(List<String> args) {
  final List<int> data = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0];
  bubbleSort(data);
  print(data);
}

bubbleSort(List<int> array) {
  if (array == null || array.length == 0) {
    return;
  }
  for (var i = 0; i < array.length - 1; i++) {
    for (var j = 0; j < array.length - i - 1; j++) {
      if (array[j] > array[j + 1]) {
        final temp = array[j];
        array[j] = array[j + 1];
        array[j + 1] = temp;
      }
    }
  }
}
