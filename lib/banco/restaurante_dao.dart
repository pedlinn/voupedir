import 'package:projetosflutter/banco/database_helper.dart';
import 'package:projetosflutter/restaurante.dart';

class RestauranteDAO{

  static Future<List<Restaurante>> ListarTodos() async {
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_restaurante');

    return resultado.map((mapa){
      return Restaurante(
        codigo: mapa['cd_restaurante'] as int,
        nome: mapa['nm_restaurante'] as String
      );
    }).toList();
  }

}