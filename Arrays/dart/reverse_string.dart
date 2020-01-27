void main() {
  print(reverse('Stoyan')); //nayotS
  print(reverse('AbA')); //AbA
}

String reverse(String str) {
  if (str == null || str.length <= 1) {
    return str;
  }
  StringBuffer sb = StringBuffer();
  for (var i = str.length - 1; i >= 0; i--) {
    sb.write(str[i]);
  }

  return sb.toString();
}
