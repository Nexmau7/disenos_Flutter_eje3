import 'package:flutter/material.dart';

class DisenoClasico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _imagenPrincipal(context),
            _nombreLugar(),
            _llamadasAccion(),
            _descripcionLugar(),
          ],
        ),
      ),
    );
  }

  Widget _imagenPrincipal(BuildContext context) {
    final alto = MediaQuery.of(context).size;
    final posicion = MediaQuery.of(context).orientation;

    return Container(
      width: double.infinity,
      height: posicion == Orientation.landscape
          ? alto.height * 0.6
          : alto.height * 0.4,
      child: FadeInImage(
        placeholder: AssetImage('assets/img/loading.gif'),
        image: NetworkImage(
            'https://www.xtrafondos.com/wallpapers/resized/rascacielos-de-en-la-marina-singapur-4207.jpg?s=large'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _nombreLugar() {
    final estiloTextoPrincipal =
        TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
    final estiloTextoSecundario = TextStyle(fontSize: 18, color: Colors.grey);

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 23, horizontal: 35),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Marina Bay Sands Hotel', style: estiloTextoPrincipal),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text('Singapur, Asia', style: estiloTextoSecundario)
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red,
              size: 25.0,
            ),
            Text(
              '41',
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }

  Widget _llamadasAccion() {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          botonesDeAccion(Icons.call, 'CALL'),
          botonesDeAccion(Icons.near_me, 'ROUTE'),
          botonesDeAccion(Icons.share, 'SHARE'),
        ],
      ),
    );
  }

  Widget botonesDeAccion(IconData icono, String nombre) {
    return Column(
      children: <Widget>[
        Icon(
          icono,
          size: 25.0,
          color: Colors.blue,
        ),
        SizedBox(height: 5.0),
        Text(
          nombre,
          style: TextStyle(fontSize: 15.0, color: Colors.blue),
        )
      ],
    );
  }

  _descripcionLugar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 20),
      child: Text(
        'Es el hotel-casino aislado más grande del mundo, valorado en más de 5.700 millones de euros propiedad de Sheldon Adelson, el mismo que quiere construir Eurovegas en Madrid, su impresionante arquitectura, diseño y lujo le hacen ser uno de los edificios más llamativos de la ciudad de Singapur. \n \n Marina Bay Sands es un conjunto hotelero, formado por tres torres de más de 200 metros de altura, en las que se reparten 2.560 habitaciones de lujo en 55 plantas. Las azoteas de las tres torres están unidas por una estructura de 340 metros de largo conocida como Skypark, en la que se encuentra una piscina de 150 metros, reconocida en todo el mundo por las increíbles vistas que tiene y por la sensación de infinidad que transmite al ser desbordante.',
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}
