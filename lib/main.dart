import 'package:flutter/material.dart';
import 'package:ejemplo/src/widgets/Error404.dart';
import 'package:ejemplo/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo de flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: getApplicationRoutes(),
      initialRoute: '/login',
      onUnknownRoute: ( RouteSettings settings ){
        return MaterialPageRoute(builder: (BuildContext context) => Error404Page());
      },
    );
  }
}