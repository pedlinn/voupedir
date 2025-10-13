import 'package:flutter/material.dart';
import 'package:projetosflutter/banco/restaurante_dao.dart';
import 'package:projetosflutter/banco/tipo_DAO.dart';
import 'tipo.dart';

class TelaCadRestaurante extends StatefulWidget {
  TelaCadRestaurante({super.key});

  @override
  State<StatefulWidget> createState() {
    return TelaCadRestauranteState();
  }
}

class TelaCadRestauranteState extends State<TelaCadRestaurante> {

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  String? culinariaSelecionada;

  List<Tipo> tiposCulinaria = [];
  int? tipoCulinaria;

  void initState(){
    super.initState();
    carregarTipos();
  }

  Future<void> carregarTipos() async{
    final lista = await TipoDAO.ListarTipos();
    setState(() {
      tiposCulinaria = lista;
    });
  }

    @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text('Cadastro de Restaurante')),
        body: Padding(padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            Text("Informações do Restaurante:"),
            SizedBox(height: 30),
            Text("Tipo de Comida: "),
            DropdownButtonFormField<String>(
                value: culinariaSelecionada,
                items: tiposCulinaria.map((tipo){
                  return DropdownMenuItem<String>(
                    value: tipo.descricao,
                    child: Text("${tipo.descricao}"),
                  );
                }).toList(),
                onChanged: (String? novaCulinaria){
                  setState(() {
                    culinariaSelecionada = novaCulinaria;
                    Tipo tipoSelecionado = tiposCulinaria.firstWhere(
                        (tipo) => tipo.descricao == novaCulinaria,
                    );
                    tipoCulinaria = tipoSelecionado.codigo;
                  });
                }
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Nome do Restaurante'),
              validator: (String? value) {},
              controller: nomeController,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Latitude'),
              validator: (String? value) {},
              controller: latitudeController,
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Longitude'),
              validator: (String? value) {},
              controller: longitudeController,
            ),
            SizedBox(height: 50),
            ElevatedButton(onPressed: () async{
              final sucesso = await RestauranteDAO.cadastrarRestaurante(
                  nomeController.text,
                  latitudeController.text,
                  longitudeController.text,
                  tipoCulinaria
              );
              String msg = 'ERRO: Restaurante não cadastrado.';
              Color corFundo = Colors.red;
              if (sucesso > 0 ){
                //sucesso é o id do restaurante cadastrado, que será maior que 0(ZERO)
                msg = '"${nomeController.text}" cadastrado! ID: $sucesso';
                corFundo = Colors.green;
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(msg),
                backgroundColor: corFundo,
                duration: Duration(seconds: 5),
                )
              );

            },
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.save),
                  Text("Cadastrar")
              ],
            ))
          ],
        ),
      ),
    );
  }
}