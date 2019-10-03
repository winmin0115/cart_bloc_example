import 'package:bloc_cart_example/bloc/cart_provider.dart';
import 'package:bloc_cart_example/catalog.dart';
import 'package:bloc_cart_example/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());
final cartBloc = CartBloc();
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return CartProvider(
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    ));
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Welcome'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('Enter'),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Catalog()));
            },
          ),
        ));
  }
}


