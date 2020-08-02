import 'dart:convert';

import 'package:apod_app_a1/src/models/apod_model.dart';
import 'package:http/http.dart'
    as http; // as http es el prefijo para poder usarla asi.
import 'package:intl/intl.dart';

class ApodProvider {
  //para construccion de la URL
  String _apiKey = 'DEMO_KEY';
  String _url = 'api.nasa.gov';
  String _hd = 'true'; // para que traiga imagenes en alta definición

  Future<List<ApodImage>> getRecentImages() async {
    //async para el resp
    //metodo para bajar las imagenes recientes
    DateTime endDate = DateTime.now();
    DateTime startDate = endDate
        .add(Duration(days: -5)); //la fecha actual menos 5 dias hacia atras
    //Uri es la clase llama al metodo https y este pide dos parametros url y endpoint
    final url = Uri.https(_url, 'planetary/apod', {
      'api_key': _apiKey,
      'hd': _hd,
      'start_date': DateFormat('y-M-d').format(startDate),
      'end_date': DateFormat('y-M-d').format(endDate)
    });

    final resp = await http.get(url); // regresa un future y por eso el async
    if (resp.statusCode == 200) {
      final decodeData = json.decode(resp.body); //transforma objetos del json
      final apodList = ApodList.fromJsonList(decodeData); //añadelos a la lista
      return apodList.items; // regresalos
    } else {
      return List<ApodImage>(); //si no hay respuesta regresa un list vacio
    }
  }
}
