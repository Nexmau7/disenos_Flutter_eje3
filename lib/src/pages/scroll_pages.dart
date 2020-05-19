import 'package:flutter/material.dart';

class ScrollPages extends StatelessWidget {
  const ScrollPages({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _pagina1(),
          _pagina2(),
        ],
      ),
    );
  }

  Widget _pagina1() {
    final estilo = TextStyle(
        fontSize: 35.0, color: Colors.white, fontWeight: FontWeight.bold);

    return Stack(
      children: <Widget>[
        _colorFondo(),
        _imagenFondo(),
        _textos(estilo),
      ],
    );
  }

  Container _colorFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
    );
  }

  Image _imagenFondo() {
    return Image(
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
      image: AssetImage('assets/img/scroll-1.png'),
    );
  }

  SafeArea _textos(TextStyle estilo) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 15.0,
          ),
          Text('11°', style: estilo),
          SizedBox(
            height: 5.0,
          ),
          Text('Miercoles', style: estilo),
          Expanded(child: Container()),
          Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
            size: 90.0,
          )
        ],
      ),
    );
  }

  Widget _pagina2() {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Color.fromRGBO(108, 192, 218, 1.0),
        ),
        Center(
          child: RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Text('Bienvenido', style: TextStyle(fontSize: 20.0)),
              color: Colors.blue,
              shape: StadiumBorder(),
              textColor: Colors.white,
              onPressed: () {}),
        )
      ],
    );
  }
}
