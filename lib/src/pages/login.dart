import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String emailCorrecto = 'DomingoMG@yopmail.com';
  String passwordCorrecto = '12345678';

  String email = '';
  String password = '';

  void registrarse() => Navigator.of(context).pushNamed('/register');

  void iniciarSesion(){
    FormState _formState = _formKey.currentState;
    if( _formState.validate() ){
      _formState.save();

      // Pertimimos el logueo y le dirigimos al HomePage
      if( emailCorrecto.toLowerCase() == email.toLowerCase() && passwordCorrecto == password ){
        print('Este es mi email: $email');
        print('Este es mi contraseña: $password');
        Navigator.of(context).pushReplacementNamed('/home');

      } else {
        alertError( 
          title: 'Error',
          message: 'El email o contraseña es incorrecto.'
        );
      }
    }
  }


  Future<bool> alertError({ String title, String message }){
    return showDialog(
      context: context,
      builder: ( BuildContext context ){
        return AlertDialog(
          title: Text('$title'),
          content: Text('$message'),
          actions: <Widget>[
            FlatButton(
              child: Text('Aceptar'),
              onPressed: ()=> Navigator.of(context).pop(),
            )
          ],
        );
      }
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginPage'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(5.0),
              elevation: 4.0,
              child: Container(
                margin: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text('Iniciar Sesión', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                        subtitle: Text('Aplicación de ejemplo', style: TextStyle(color: Colors.black), textAlign: TextAlign.center),
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Introduzca su email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                          )
                        ),
                        validator: ( String value ) {
                          if( value.isEmpty ) {
                            return 'El campo no debe estar vacío';
                          } else {
                            return null;
                          }
                        },
                        onSaved: ( String value ) => email = value.replaceAll(' ', ''),
                      ),

                      SizedBox(height: 16),  
                      
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          hintText: 'Introduzca su contraseña',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0)
                          )
                        ),
                        validator: ( String value ) {
                          if( value.isEmpty ) {
                            return 'El campo no debe estar vacío';
                          } else {
                            if( value.length < 6 ){
                              return 'La contraseña es debil';
                            } else {
                              return null;
                            }
                          }
                        },
                        onSaved: ( String value ) => password = value,
                      ),

                      SizedBox(height: 16),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            child: Text('Registrarse', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            color: Colors.red[900],
                            onPressed: () => registrarse(),
                          ),

                          RaisedButton(
                            child: Text('Iniciar Sesión', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            color: Colors.green,
                            onPressed: () => iniciarSesion(),
                          ),


                        ],
                      )
                    
                    
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}