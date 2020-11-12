import 'dart:convert';
import 'package:flutter_clean_arch/modules/pesquisa/domain/model/pesquisa_resultado.dart';

class PesquisaResultadoModel extends PesquisaResultado {
  final String id;
  final String apelido;
  final String imagem;
  final String url;

  PesquisaResultadoModel({this.id, this.apelido, this.imagem, this.url});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'apelido': apelido,
      'imagem': imagem,
      'url': url,
    };
  }

  factory PesquisaResultadoModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PesquisaResultadoModel(
      id: map['id'],
      apelido: map['apelido'],
      imagem: map['imagem'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PesquisaResultadoModel.fromJson(String source) => PesquisaResultadoModel.fromMap(json.decode(source));
}
