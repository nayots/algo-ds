void main() {
  //find common items in 2 arrays if unknown size
  // result is boolean if there is a common item or not

  print(findCommonItem(['a', 'b', 'c', 'x'], ['z', 'y', 'a'])); //true
  print(findCommonItem(['a', 'b', 'c', 'x'], ['z', 'y', 'w'])); //false
}

bool findCommonItem(List<String> collectionA, List<String> collectionB) {
  Set<String> map = {};

  for (var i = 0; i < collectionA.length; i++) {
    map.add(collectionA[i]);
  }

  for (var j = 0; j < collectionB.length; j++) {
    if (map.contains(collectionB[j])) {
      return true;
    }
  }
  return false;
}
