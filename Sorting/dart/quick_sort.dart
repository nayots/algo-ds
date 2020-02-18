main(List<String> args) {
  final arr = [10, 80, 30, 90, 40, 50, 70];
  // INFO 📘: should result in [10, 30, 40, 50, 70, 80, 90]
  quickSort(arr, 0, arr.length - 1);
  print(arr);
}

int partition(List<int> arr, int low, int high) {
  StringBuffer sb = StringBuffer(); // INFO 📘: For debugging
  sb.writeln(
      'For partition: ${arr.sublist(low, high)} of ${arr} with pivot ${arr[high]}'); // INFO 📘: For debugging
  int pivot = arr[high];
  int i = (low - 1);
  for (var j = low; j <= high - 1; j++) {
    if (arr[j] <= pivot) {
      sb.write('${arr.toString()} i: $i j: $j to'); // INFO 📘: For debugging
      i++;
      swap(arr, i, j);
      sb.writeln(
          ' i: $i ${arr[j]}<==>${arr[i]} j: $j ${arr.toString()}'); // INFO 📘: For debugging
    }
  }
  swap(arr, i + 1, high);
  sb.writeln(
      '$arr => new partition index: ${i + 1}: ${arr[i + 1]}'); // INFO 📘: For debugging
  print(sb); // INFO 📘: For debugging
  return i + 1;
}

void quickSort(List<int> arr, int low, int high) {
  if (low < high) {
    int partitionIndex = partition(arr, low, high);

    quickSort(arr, low, partitionIndex - 1);
    quickSort(arr, partitionIndex + 1, high);
  }
}

void swap(List<int> arr, int a, int b) {
  int temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;
}
