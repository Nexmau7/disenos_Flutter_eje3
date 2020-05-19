import 'package:flutter/material.dart';
 
import 'package:disenos_eje3/src/pages/diseno_basico.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diseños Flutter',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context)=> DisenoClasico(),
      },
      
    );
  }
}