import 'package:bloc_cart_example/item.dart';
import 'package:bloc/bloc.dart';

enum CartEventType {
  add, remove
}

class CartEvent {
  final CartEventType type;
  final Item item;

  CartEvent(this.type, this.item);
}

class CartBloc extends Bloc<CartEvent, List<Item>> {
  @override
  List<Item> get initialState => [];

  @override
  Stream<List<Item>> mapEventToState(CartEvent event) async* {
    switch(event.type) {
      case CartEventType.add:
        currentState.add(event.item);
        break;
      case CartEventType.remove:
        currentState.remove(event.item);
        break;
    }
    yield currentState;
  }

}