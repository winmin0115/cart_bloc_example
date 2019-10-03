import 'package:bloc_cart_example/cart.dart';
import 'package:bloc_cart_example/item.dart';
import 'package:bloc_cart_example/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  List<Item> _itemList = itemList;

  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<CartBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.archive),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => Cart()));
            },
          )
        ],
      ),
      body: BlocProvider(
        bloc: _cartBloc,
        child: BlocBuilder(
            bloc: _cartBloc,
            builder: (BuildContext context, List state) {
              return ListView(
                children: _itemList
                    .map((item) => _buildItem(item, state, _cartBloc))
                    .toList(),
              );
            }),
      ),
    );
  }

  Widget _buildItem(Item item, List state, CartBloc cartBloc) {
    final isChecked = state.contains(item);

    return Padding(
      child: ListTile(
        title: Text(
          item.title,
          style: TextStyle(fontSize: 31.0),
        ),
        subtitle: Text('${item.price}'),
        trailing: IconButton(
          icon: isChecked
              ? Icon(Icons.check, color: Colors.red)
              : Icon(Icons.check),
          onPressed: () {
            setState(() {
              if (isChecked) {
                cartBloc.dispatch(CartEvent(CartEventType.remove, item));
              } else {
                cartBloc.dispatch(CartEvent(CartEventType.add, item));
              }
            });

          },
        ),
      ),
      padding: const EdgeInsets.all(8.0),
    );
  }
}
