import 'package:flutter_clean_arch/modules/pesquisa/domain/errors/exceptions.dart';
import 'package:flutter_clean_arch/modules/pesquisa/domain/model/pesquisa_resultado.dart';

abstract class PesquisaState {}

class PesquisaSucesso implements PesquisaState {
  final List<PesquisaResultado> list;

  PesquisaSucesso(this.list);
}

class PesquisaInicia implements PesquisaState {}

class PesquisaCarregando implements PesquisaState {}

class PesquisaErro implements PesquisaState {
  final PesquisaException error;
  PesquisaErro(this.error);
}
