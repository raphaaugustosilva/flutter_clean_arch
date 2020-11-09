import 'package:flutter_clean_arch/modules/pesquisa/domain/model/pesquisa_resultado.dart';

abstract class PesquisaRepository {
  Future<List<PesquisaResultado>> pesquisar(String textoPesquisa);
}
