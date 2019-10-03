import 'package:bloc_cart_example/item.dart';
import 'package:rxdart/rxdart.dart';

enum CartEventType {
  add, remove
}

class CartEvent {
  final CartEventType type;
  final Item item;

  CartEvent(this.type, this.item);
}

class CartBloc {
  final itemList = [
    Item("맥북", 2000000),
    Item("허쉬아이스크림", 1200),
    Item("초코과자", 200),
    Item("안병래", 100),
    Item("고민수", 10),
    Item("김승민", 200000000)
  ];

  final _cartList = List<Item>();

  final _cartListSubject = BehaviorSubject<List<Item>>.seeded([]);

  Stream<List<Item>> get cartList => _cartListSubject.stream;

  void add(CartEvent event) {
    switch(event.type) {
      case CartEventType.remove:
        _cartList.remove(event.item);
        break;
      case CartEventType.add:
        _cartList.add(event.item);
        break;
    }
    _cartListSubject.add(_cartList);
  }
}


