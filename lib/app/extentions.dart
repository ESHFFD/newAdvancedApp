// extentions non nullabel in string
extension NonNullOnString on String? {
  String orEmpty() {
    if (this == null) {
      return '';
    }
    return this!;
  }
}

extension NonNullOnInt on int? {
  int orEmpty() {
    if (this == null) {
      return 0;
    }
    return this!;
  }
}
