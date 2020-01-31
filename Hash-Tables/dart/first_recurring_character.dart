//Google Question
//Given an array = [2,5,1,2,3,5,1,2,4]:
//It should return 2

//Given an array = [2,1,1,2,3,5,1,2,4]:
//It should return 1

//Given an array = [2,3,4,5]:
//It should return undefined
main(List<String> args) {
  print(firstRecurringCharacter([2, 5, 1, 2, 3, 5, 1, 2, 4]));
  print(firstRecurringCharacter([2, 1, 1, 2, 3, 5, 1, 2, 4]));
  print(firstRecurringCharacter([2, 3, 4, 5]));
}

int firstRecurringCharacter(List<int> input) {
  if (input == null || input.length == 0) {
    return null;
  }
  Set<int> numbersSet = {};
  for (var i = 0; i < input.length; i++) {
    if (numbersSet.contains(input[i])) {
      return input[i];
    } else {
      numbersSet.add(input[i]);
    }
  }

  return null;
}
