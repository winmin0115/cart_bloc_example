import 'package:bloc_cart_example/bloc/cart_bloc.dart';
import 'package:flutter/widgets.dart';

class CartProvider extends InheritedWidget {
  final CartBloc cartBloc;

  CartProvider({CartBloc cartBloc, Widget child})
      : cartBloc = cartBloc ?? CartBloc(),
        super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static CartBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(CartProvider) as CartProvider).cartBloc;
}
