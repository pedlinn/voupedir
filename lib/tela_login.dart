import 'package:flutter/material.dart';
import 'package:projetosflutter/usuario.dart';
import 'tela_home.dart';

class TelaLogin extends StatelessWidget{
  TelaLogin({super.key});

  Usuario u = Usuario(
    nome: 'admin',
    login: 'admin',
    senha: '@senhaforte123',
    codigo: 1
  );

final TextEditingController usuarioController = TextEditingController();
final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Tela de Login")),
      body: Padding(padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Usuário'),
              controller: usuarioController,
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
              controller: senhaController,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){
              if(u.login == usuarioController.text && u.senha == senhaController.text){
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => TelaHome())
                );
              }else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("usuário ou senha inválidos!!"))
                );
              }
            }, child: const Text('Logar'))
          ],
        ),
      ),
    );
  }
}