main(List<String> args) {
  print(fibonacci(8));
  print(fibonacciIterative(8));
}

int fibonacci(int n) {
  if (n < 2) {
    return n;
  }

  return fibonacci(n - 1) + fibonacci(n - 2);
}

int fibonacciIterative(int n) {
  List<int> arr = [0, 1];
  for (var i = 2; i <= n; i++) {
    arr.add(arr[i - 1] + arr[i - 2]);
  }
  return arr[n];
}
