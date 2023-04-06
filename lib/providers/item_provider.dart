import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotel_menu_app/model/item.dart';

class ItemProvider with ChangeNotifier {
  static const int maxCount = 10;
  final Map<Item, int> _map = {};
  late final List<Item> _list;

  ItemProvider(this._list) {
    for (Item i in _list) {
      _map[i] = 0;
    }
  }

  List<Item> get list => List.unmodifiable(_list);

  int getItemCount(Item item) {
    _verifyItemFound(item);
    return _map[item]!;
  }

  void increaseCountByOne(Item item) {
    _verifyItemFound(item);
    _map.update(item, (v) => v >= maxCount ? maxCount : v + 1);
    notifyListeners();
  }

  void decreaseCountByOne(Item item) {
    _verifyItemFound(item);
    _map.update(item, (v) => v <= 1 ? 0 : v - 1);
    notifyListeners();
  }

  _verifyItemFound(Item item) {
    if (!_list.contains(item)) {
      throw Exception("Unknown Item");
      //this condition should never happen; it means the backing list does not contain the given item
    }
  }

  int get total {
    int total = 0;
    for (var e in _map.entries) {
      total += (e.key.price * e.value);
    }
    return total;
  }

  Map<Item, int> filterItem() {
    var selectedItem = <Item, int>{};
    selectedItem.addAll(_map);
    selectedItem.removeWhere((item, count) => count == 0);
    print(selectedItem);
    return selectedItem;
  }
}
