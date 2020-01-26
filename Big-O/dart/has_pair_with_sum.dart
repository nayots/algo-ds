void main() {
  //exercise from here : https://youtu.be/XKu_SEDAykw?t=903
  print(hasPair([1, 2, 3, 9], 8)); //false
  print(hasPair([1, 2, 4, 4], 8)); //true
  print(hasPair([1, 2, 3, 5], 8)); //true
  print(hasPair([1, 2, 5, 3], 8)); //true
  print(hasPair([1, 2, 5, 1, 3], 8)); //true
}

bool hasPair(List<int> nums, int sum) {
  if (nums == null || sum == null) {
    return false;
  }
  Set<int> comp = Set<int>();
  for (var value in nums) {
    if (comp.contains(value)) {
      return true;
    }
    comp.add(sum - value);
  }
  return false;
}
