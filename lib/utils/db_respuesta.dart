import 'package:estudiantes/models/respuestas.dart';
import 'package:estudiantes/utils/db_helper.dart';

class DBRespuesta extends DBHelper {

  DBRespuesta() : super();

  Future<Respuestas> saveProduct(Respuestas respuestas) async {
    var dbClient = await db;
    respuestas.iD = await dbClient.insert(DBHelper.TABLES[3], respuestas.toMap());
    return respuestas;
  }

  Future<List<Respuestas>> getAllProduct() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.rawQuery("SELECT * FROM ${DBHelper.TABLES[3]}");
    List<Respuestas> respuesta = [];
    for (var item in maps) {
      respuesta.add(Respuestas.fromMap(item));
    }
    return respuesta;
  }
  
}