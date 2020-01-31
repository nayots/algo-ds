main(List<String> args) {
  final myHashTable = HashTable(size: 2);
  myHashTable.set('grapes', 10000);
  print(myHashTable.get('grapes'));
  myHashTable.set('apples', 9);
  print(myHashTable.get('apples'));
  print(myHashTable.keys());
}

class HashTable {
  List<List<List<dynamic>>> data;

  HashTable({size: int}) {
    data = List<List<List<dynamic>>>(size);
  }

  int _hash(String key) {
    var hash = 0;
    for (var i = 0; i < key.length; i++) {
      hash = (hash + key.codeUnitAt(i) * i) % this.data.length;
    }

    return hash;
  }

  void set(String key, dynamic value) {
    int address = _hash(key);
    if (data[address] == null) {
      data[address] = [];
    }
    data[address].add([key, value]);
  }

  dynamic get(String key) {
    int address = _hash(key);
    List<List<dynamic>> currentBucket = data[address];
    if (currentBucket != null) {
      for (var i = 0; i < currentBucket.length; i++) {
        if (currentBucket[i][0] == key) {
          return currentBucket[i][1];
        }
      }
    }
    return null;
  }

  List<String> keys() {
    final List<String> keysList = [];
    for (var i = 0; i < data.length; i++) {
      final bucket = data[i];
      if (bucket != null) {
        for (var j = 0; j < bucket.length; j++) {
          keysList.add(bucket[j][0]);
        }
      }
    }
    return keysList;
  }
}
