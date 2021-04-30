import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  void cerrarSesion() => Navigator.of(context).pushReplacementNamed('/login');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RegisterPage'),
      ),
      body: Container(
        child: Center(
          child: Text('Ventana de registrarse')
        ),
      ),
    );
  }
}