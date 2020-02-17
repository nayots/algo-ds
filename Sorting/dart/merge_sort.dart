main(List<String> args) {
  final answer = mergeSort([38, 27, 43, 3, 9, 82, 10]);
  // should result in [3, 9, 10, 27, 38, 43, 82]
  print(answer);
}

List<int> merge(List<int> left, List<int> right) {
  List<int> result = [];
  int i = 0;
  int j = 0;
  while (i < left.length && j < right.length) {
    if (left[i] <= right[j]) {
      result.add(left[i]);
      i++;
    } else {
      result.add(right[j]);
      j++;
    }
  }

  while (i < left.length) {
    result.add(left[i]);
    i++;
  }
  while (j < right.length) {
    result.add(right[j]);
    j++;
  }
  return result;
}

List<int> mergeSort(List<int> array) {
  if (array.length == 1) {
    return array;
  }

  final n = (array.length / 2).ceil();

  final left = array.take(n).toList();
  final right = array.skip(n).take(n).toList();

  return merge(mergeSort(left), mergeSort(right));
}
