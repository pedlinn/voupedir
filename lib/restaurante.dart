import 'dart:ffi';

import 'usuario.dart';
import 'tipo.dart';

class Restaurante {
  int? _codigo;
  String? _nome;
  double? _latitude;
  double? _longitude;
  Usuario? _proprietario;
  Tipo? _tipo;

  //construtor
  Restaurante({int? codigo, String? nome, double? latitude, double? longitude,
    Usuario? proprietario, Tipo? tipo}){
    _codigo = codigo;
    _nome = nome;
    _latitude = latitude;
    _longitude = longitude;
    _proprietario = proprietario;
    _tipo = tipo;

  }

  //getters
  int? get codigo => _codigo;
  String? get nome => _nome;
  double? get latitude => _latitude;
  double? get longitude => _longitude;
  Usuario? get proprietario => _proprietario;
  Tipo? get tipo => _tipo;

  //setters
  set codigo(int? novoCodigo) => _codigo = novoCodigo;
  set nome(String? novoNome) => _nome = novoNome;
  set latitude(double? novoLatitude) => _latitude = novoLatitude;
  set longitude(double? novoLongitude) => _longitude = novoLongitude;
  set proprietario(Usuario? novoProprietario) => _proprietario = novoProprietario;
  set tipo(Tipo? novoTipo) => _tipo = novoTipo;
}