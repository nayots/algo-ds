void main(List<String> args) {
  print(mergeSorted(arr1: [1, 2, 3, 4, 5], arr2: [5, 6, 18, 21]));
}

List<int> mergeSorted({List<int> arr1, List<int> arr2}) {
  if (arr1 == null || arr2 == null) {
    return null;
  }

  int i = 0;
  int j = 0;
  int arr1Item = arr1[i];
  int arr2Item = arr2[j];

  List<int> merged = List();
  while (arr1Item != null || arr2Item != null) {
    if (arr1Item != null && (arr2Item == null || arr1Item < arr2Item)) {
      merged.add(arr1Item);
      i++;
      arr1Item = i < arr1.length ? arr1[i] : null;
    } else {
      merged.add(arr2Item);
      j++;
      arr2Item = j < arr2.length ? arr2[j] : null;
    }
  }

  return merged;
}
