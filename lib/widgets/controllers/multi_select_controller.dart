import 'package:flutter/cupertino.dart';

class MultiSelectController<T> extends ChangeNotifier {
  List<T> selectedItem = [];

  T removeItemAt(int index) {
    final returnValue = selectedItem.removeAt(index);
    notifyListeners();
    return returnValue;
  }

  void removeItem(T item) {
    if (selectedItem.remove(item)) notifyListeners();
  }

  void addItem(T item) {
    if (!selectedItem.contains(item)) {
      selectedItem.add(item);
      notifyListeners();
    }
  }

  void startSelect(T item) {
    addItem(item);
    notifyListeners();
  }

  void onTap(T item) {
    if (isSelected(item)) {
      removeItem(item);
    } else {
      addItem(item);
    }
  }

  ///validate selected items
  void validateItems(List<T> newItems) {
    var result = true;
    selectedItem.retainWhere((element) {
      var check = newItems.contains(element);
      result = result && check;
      return check;
    });
    if (!result) notifyListeners();
  }

  bool isSelected(T item) {
    return (selectedItem.contains(item));
  }

  bool get isSelecting {
    return selectedItem.isNotEmpty;
  }

  ///This only clear all data and will not notify listeners
  ///Used for enter new page with empty data
  void refresh() {
    selectedItem.clear();
  }

  void clearAll() {
    selectedItem.clear();
    notifyListeners();
  }

  void selectAll() {

  }
}