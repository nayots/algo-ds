main(List<String> args) {
  final List<int> data = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0];
  selectionSort(data);
  print(data);
}

selectionSort(List<int> array) {
  if (array == null || array.length == 0) {
    return;
  }
  for (var i = 0; i < array.length; i++) {
    int minIndex = i;
    for (var j = i + 1; j < array.length; j++) {
      if (array[j] < array[minIndex]) {
        minIndex = j;
      }
    }
    int temp = array[i];
    array[i] = array[minIndex];
    array[minIndex] = temp;
  }
}
