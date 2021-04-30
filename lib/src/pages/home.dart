import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void cerrarSesion() => Navigator.of(context).pushReplacementNamed('/login');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('Cerrar sesión'),
            onPressed: ()=> cerrarSesion(),
          ),
        ),
      ),
    );
  }
}