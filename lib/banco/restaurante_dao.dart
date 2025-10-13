import 'package:projetosflutter/banco/database_helper.dart';
import 'package:projetosflutter/banco/usuario_dao.dart';
import 'package:projetosflutter/restaurante.dart';

class RestauranteDAO{

  static Future<List<Restaurante>> ListarTodos() async {
    final db = await DatabaseHelper.getDatabase();
    final resultado = await db.query('tb_restaurante',
        where: 'cd_usuario = ?',
    whereArgs: [UsuarioDAO.usuarioLogado.codigo]
    );


    return resultado.map((mapa){
      return Restaurante(
        codigo: mapa['cd_restaurante'] as int,
        nome: mapa['nm_restaurante'] as String
      );
    }).toList();
  }

  static Future<int> cadastrarRestaurante(
      String? nomeRestaurante,
      String? latitude,
      String? longitude,
      int? tipo
      ) async{
    final db = await DatabaseHelper.getDatabase();
    final dadosRestaurante = {
      'cd_tipo': tipo,
      'nm_restaurante': nomeRestaurante,
      'latitude_restaurante': latitude,
      'longitude_restaurante': longitude,
      'cd_usuario': 1
    };
    try{
      final idRestaurante = await db.insert('tb_restaurante', dadosRestaurante);
      return idRestaurante;
    } catch(e){
      print("Erro ao cadastrar restaurante: $e");
      return -1;
    }

  }

}