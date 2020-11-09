import 'package:flutter_clean_arch/modules/pesquisa/domain/errors/exceptions.dart';
import 'package:flutter_clean_arch/modules/pesquisa/domain/model/pesquisa_resultado.dart';
import 'package:flutter_clean_arch/modules/pesquisa/domain/repositories/pesquisa_repository.dart';

abstract class PesquisaPorTexto {
  Future<List<PesquisaResultado>> executar(String textoPesquisa);
}

class PesquisaPorTextoImpl implements PesquisaPorTexto {
  final PesquisaRepository repository;
  PesquisaPorTextoImpl(this.repository);

  @override
  Future<List<PesquisaResultado>> executar(String textoPesquisa) async {
    if (textoPesquisa == null || textoPesquisa.isEmpty) throw TextoInvalidoException();
    return repository.pesquisar(textoPesquisa);
  }
}
