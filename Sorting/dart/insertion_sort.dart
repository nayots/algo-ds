main(List<String> args) {
  final List<int> data = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0];
  insertionSort(data);
  print(data);
}

insertionSort(List<int> array) {
  if (array == null || array.length == 0) {
    return;
  }
  for (var i = 0; i < array.length; i++) {
    int temp = array[i];
    int j = i;

    while (j > 0 && temp < array[j - 1]) {
      array[j] = array[j - 1];
      j = j - 1;
    }
    array[j] = temp;
  }
}
