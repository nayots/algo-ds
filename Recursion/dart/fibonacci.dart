main(List<String> args) {
  int n = 35;

  print(fibonacci(n));
  print('Fibonacci recursive for ${n}th number: ${calculations} calculations');
  calculations = 0;

  print(fibonacciIterative(n));
  print('Fibonacci iterative for ${n}th number: ${calculations} calculations');
  calculations = 0;

  final fibboM = fibonacciMemoized();
  print(fibboM(n));
  print(
      'Fibonacci recursive with memoization for ${n}th number: ${calculations} calculations');
}

int calculations = 0;

Function fibonacciMemoized() {
  Map<int, int> cache = {};

  int fibbo(int n) {
    calculations++;
    if (cache.containsKey(n)) {
      return cache[n];
    }
    if (n < 2) {
      return n;
    }
    final int result = fibbo(n - 1) + fibbo(n - 2);
    cache[n] = result;
    return result;
  }

  return fibbo;
}

int fibonacci(int n) {
  calculations++;
  if (n < 2) {
    return n;
  }

  return fibonacci(n - 1) + fibonacci(n - 2);
}

int fibonacciIterative(int n) {
  calculations++;
  List<int> arr = [0, 1];
  for (var i = 2; i <= n; i++) {
    arr.add(arr[i - 1] + arr[i - 2]);
  }
  return arr[n];
}
