import 'package:flutter_clean_arch/modules/pesquisa/infra/models/pesquisa_resultado_model.dart';

abstract class PesquisaDataSource {
  Future<List<PesquisaResultadoModel>> pesquisar(String textoPesquisa);
}
