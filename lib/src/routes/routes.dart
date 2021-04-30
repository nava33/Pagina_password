import 'package:flutter/material.dart';

import 'package:ejemplo/src/pages/login.dart';
import 'package:ejemplo/src/pages/register.dart';
import 'package:ejemplo/src/pages/home.dart';

Map<String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
    '/home':  ( BuildContext context ) => HomePage(),
    '/login': ( BuildContext context ) => LoginPage(),
    '/register': ( BuildContext context ) => RegisterPage()
  };
}