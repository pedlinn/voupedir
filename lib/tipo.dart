class Tipo {
  int? _codigo;
  String? _descricao;

  //construtor
  Tipo({int? codigo, String? descricao}) {
    _codigo = codigo;
    _descricao = descricao;
  }

//getters
  int? get codigo => _codigo;

  String? get descricao => _descricao;

//setters
  set codigo(int? novoCodigo) => _codigo = novoCodigo;
  set descricao(String? novodescricao) => _descricao = novodescricao;
}