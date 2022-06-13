extension ListExtension<T> on List<T> {

  bool removeThenAddToOther(String value, List<String> addedTo) {
    if (remove(value)) {
      addedTo.add(value);
      return true;
    } else {
      return false;
    }
  }
}