import 'dart:convert';
import 'package:flutter_clean_arch/modules/pesquisa/domain/model/pesquisa_resultado.dart';

class PesquisaResultadoModel extends PesquisaResultado {
  final String titulo;
  final String conteudo;
  final String imagem;

  PesquisaResultadoModel({this.titulo, this.conteudo, this.imagem});

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'conteudo': conteudo,
      'imagem': imagem,
    };
  }

  factory PesquisaResultadoModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PesquisaResultadoModel(
      titulo: map['titulo'],
      conteudo: map['conteudo'],
      imagem: map['imagem'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PesquisaResultadoModel.fromJson(String source) => PesquisaResultadoModel.fromMap(json.decode(source));
}
