import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class PaginaBotones extends StatelessWidget {
  const PaginaBotones({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoDiseno(context),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _textoCabezera(),
                _botonesEstructura(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: _menuPersonalizadoAbajo(context),
    );
  }

  Widget _menuPersonalizadoAbajo(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
          primaryColor: Colors.pinkAccent,
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.timeline), title: Container()),
          BottomNavigationBarItem(
              icon: Icon(Icons.whatshot), title: Container()),
        ],
      ),
    );
  }

  Widget _fondoDiseno(BuildContext context) {
    final tamanoRetrato = MediaQuery.of(context).size.width * 0.85;
    final tamanoPaisaje = MediaQuery.of(context).size.height * 0.85;
    final posicion = MediaQuery.of(context).orientation;

    final _colorFondoGradiante = Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.6),
              end: FractionalOffset(0.0, 1.0),
              // begin: Alignment.topCenter,
              // end: Alignment.bottomCenter,
              colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0),
          ])),
    );

    final _cuboRosado = Transform.rotate(
      angle: -pi / 5, //Cambia la Rotacion!!!
      child: Container(
        width: posicion == Orientation.portrait ? tamanoRetrato : tamanoPaisaje,
        height:
            posicion == Orientation.portrait ? tamanoRetrato : tamanoPaisaje,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            gradient: LinearGradient(colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0)
            ])),
      ),
    );

    return Stack(
      children: <Widget>[
        _colorFondoGradiante,
        Positioned(
          top: -100,
          child: _cuboRosado,
        ),
      ],
    );
  }

  Widget _textoCabezera() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Classify Transaction',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              'Classify This transaction into a particular category',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _botonesEstructura() {
    return Table(
      children: [
        TableRow(children: [
          _botones('General', Icons.vpn_lock, Colors.blueAccent),
          _botones('Transport', Icons.directions_bus, Colors.deepPurple[400]),
        ]),
        TableRow(children: [
          _botones('Shopping', Icons.card_giftcard, Colors.pinkAccent),
          _botones('Bills', Icons.receipt, Colors.orangeAccent),
        ]),
        TableRow(children: [
          _botones('Entertainment', Icons.movie_filter, Colors.indigo),
          _botones('Grocery', Icons.hot_tub, Colors.greenAccent),
        ]),
      ],
    );
  }

  Widget _botones(String nombre, IconData icono, Color color) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), //blur
        child: Container(
          margin: EdgeInsets.all(15.0),
          padding: EdgeInsets.all(15.0),
          height: 180.0,
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CircleAvatar(
                radius: 35.0,
                backgroundColor: color,
                child: Icon(
                  icono,
                  size: 30.0,
                  color: Colors.white,
                ),
              ),
              Text(
                nombre,
                style: TextStyle(color: color, fontSize: 17.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
