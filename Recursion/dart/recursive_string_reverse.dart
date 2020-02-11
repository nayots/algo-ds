main(List<String> args) {
  Reverser rv = Reverser();
  rv.reverse('Stoyan');
}

class Reverser {
  final StringBuffer sb = StringBuffer();
  reverse(String str) {
    if (str == null || str.length < 1) {
      print(sb);
      return;
    }

    sb.write(str[str.length - 1]);
    reverse(str.substring(0, str.length - 1));
  }
}
