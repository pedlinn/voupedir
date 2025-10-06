import 'package:flutter/material.dart';
import 'package:projetosflutter/banco/restaurante_dao.dart';
import 'package:projetosflutter/restaurante.dart';
import 'package:projetosflutter/tela_cad_restaurante.dart';

class TelaHome extends StatefulWidget {
  TelaHome({super.key});

  @override
  State<TelaHome> createState() => TelaHomeState();
}


class TelaHomeState extends State<TelaHome> {
  List <Restaurante> restaurantes = [];

  Future <void> carregaRestaurantes() async{
    final lista = await RestauranteDAO.ListarTodos();
    setState((){
      restaurantes = lista;
    });
  }

  @override
  void initState(){
    super.initState();
    carregaRestaurantes();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Lista de Restaurantes "),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => TelaCadRestaurante()));
            }, icon: Icon(Icons.add))
          ],
      ),
      body: Padding(padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: restaurantes.length,
          itemBuilder: (context, index){
            final r = restaurantes[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(r.nome ?? 'Sem nome'),
                subtitle: Text('ID: ${r.codigo}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: (){
                      //Codigo para editar restaurante
                    },
                        icon: Icon(Icons.edit, color: Colors.yellow)
                    ),
                    IconButton(
                        onPressed: (){
                      AlertDialog(
                        title: Text("Confirmar ação"),
                        content: Text("Deseja realmente excluir?"),
                        actions: [
                            TextButton(
                                onPressed: (){
                                //codigo para excluir o registro
                                },
                                child: Text("sim")
                            ),
                          TextButton(
                                onPressed: (){
                                //
                                },
                              child: Text("não")
                          )
                        ],
                      );
                    },
                        icon: Icon(Icons.delete, color: Colors.red)
                    )
                  ],
                ),
              ),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => TelaCadRestaurante()));
          },
        child: Icon(Icons.add),
      ),
    );
  }
}