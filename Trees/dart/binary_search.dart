main(List<String> args) {
  // O n(log n)
  binarySearch([1, 2, 4, 8, 16, 32, 64, 128, 256, 512], 512);
  // INFO 📘: will result in:
  // Section: [1, 2, 4, 8, 16, 32, 64, 128, 256, 512] , pivot: 4:[16], si: 0 - ei: 9
  // Section: [32, 64, 128, 256, 512] , pivot: 7:[128], si: 5 - ei: 9
  // Section: [256, 512] , pivot: 8:[256], si: 8 - ei: 9
  // Section: [512] , pivot: 9:[512], si: 9 - ei: 9
  // Found 512 at index 9
}

void binarySearch(List<int> arr, int value) {
  int startIndex = 0;
  int endIndex = arr.length - 1;

  while (startIndex <= endIndex) {
    int pivot = ((startIndex + endIndex) / 2).floor();
    print(
        'Section: ${arr.sublist(startIndex, endIndex + 1)} , pivot: $pivot:[${arr[pivot]}], si: $startIndex - ei: $endIndex');
    if (arr[pivot] == value) {
      print('Found $value at index $pivot');
      return;
    } else if (arr[pivot] < value) {
      startIndex = pivot + 1;
    } else {
      endIndex = pivot - 1;
    }
  }

  print('Could not find $value');
}
