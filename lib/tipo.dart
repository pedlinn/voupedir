class Tipo {
  int? _codigo;
  String? _nome;

  //construtor
  Tipo({int? codigo, String? nome}) {
    _codigo = codigo;
    _nome = nome;
  }

//getters
  int? get codigo => _codigo;

  String? get nome => _nome;

//setters
  set codigo(int? novoCodigo) => _codigo = novoCodigo;
  set nome(String? novoNome) => _nome = novoNome;
}