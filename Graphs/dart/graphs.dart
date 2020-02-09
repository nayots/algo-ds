import 'dart:collection';

main(List<String> args) {
  final myGraph = new Graph();
  myGraph.addVertex('0');
  myGraph.addVertex('1');
  myGraph.addVertex('2');
  myGraph.addVertex('3');
  myGraph.addVertex('4');
  myGraph.addVertex('5');
  myGraph.addVertex('6');
  myGraph.addEdge('3', '1');
  myGraph.addEdge('3', '4');
  myGraph.addEdge('4', '2');
  myGraph.addEdge('4', '5');
  myGraph.addEdge('1', '2');
  myGraph.addEdge('1', '0');
  myGraph.addEdge('0', '2');
  myGraph.addEdge('6', '5');

  myGraph.showConnections();
//Answer:
// 0-->1 2
// 1-->3 2 0
// 2-->4 1 0
// 3-->1 4
// 4-->3 2 5
// 5-->4 6
// 6-->5
}

class Graph {
  int numberOfNodes = 0;
  HashMap<String, List<String>> adjacentList;
  Graph() {
    adjacentList = HashMap();
  }
  addVertex(String node) {
    adjacentList[node] = [];
    numberOfNodes++;
  }

  addEdge(node1, node2) {
    if (adjacentList.containsKey(node1) && adjacentList.containsKey(node2)) {
      adjacentList[node1].add(node2);
      adjacentList[node2].add(node1);
    }
  }

  showConnections() {
    final allNodes = adjacentList.keys.toList();
    allNodes.sort();
    for (var node in allNodes) {
      final nodeConnections = adjacentList[node];
      String connections = "";
      var vertex;
      for (vertex in nodeConnections) {
        connections += vertex + " ";
      }
      print(node + "-->" + connections);
    }
  }
}