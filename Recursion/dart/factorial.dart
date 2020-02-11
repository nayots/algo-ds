main(List<String> args) {
  print(calculateFactorial(20));
  print(calculateFactorialIterative(20));
}

int calculateFactorial(int n) {
  if (n == 1) {
    return 1;
  }
  return n * calculateFactorial(n - 1);
}

int calculateFactorialIterative(int n) {
  int result = 1;
  for (var i = n; i > 0; i--) {
    result *= i;
  }

  return result;
}
