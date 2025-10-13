import 'package:projetosflutter/banco/database_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:projetosflutter/tipo.dart';

  class TipoDAO{

    static Future<List<Tipo>> ListarTipos() async{

      final db = await DatabaseHelper.getDatabase();
      final resultado = await db.query('tb_tipo');
    
      return resultado.map((mapa) {
        return Tipo(
            codigo: mapa['cd_tipo'] as int,
            descricao: mapa['nm_tipo'] as String
        );
      }).toList();
    }
  }