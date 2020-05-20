import 'package:flutter/material.dart';
 
import 'package:disenos_eje3/src/pages/botones_pages.dart';
import 'package:disenos_eje3/src/pages/scroll_pages.dart';
import 'package:disenos_eje3/src/pages/diseno_basico.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Cambiar Color Status Bar!!!
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.white//Con el notch de IOS se nota
    ));

    return MaterialApp(
      title: 'Diseños Flutter',
      debugShowCheckedModeBanner: false,
      initialRoute: 'botones',
      routes: {
        'basico' : (context)=> DisenoClasico(),
        'scroll'  : (context)=>ScrollPages(),
        'botones' : (context)=>PaginaBotones()
      },
      
    );
  }
}