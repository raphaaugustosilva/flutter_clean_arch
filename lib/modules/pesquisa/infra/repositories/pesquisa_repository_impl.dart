import 'package:flutter_clean_arch/modules/pesquisa/domain/errors/exceptions.dart';
import 'package:flutter_clean_arch/modules/pesquisa/domain/model/pesquisa_resultado.dart';
import 'package:flutter_clean_arch/modules/pesquisa/domain/repositories/pesquisa_repository.dart';
import 'package:flutter_clean_arch/modules/pesquisa/infra/datasources/pesquisa_datasource.dart';

class PesquisaRepositoryImpl implements PesquisaRepository {
  final PesquisaDataSource dataSource;
  PesquisaRepositoryImpl(this.dataSource);

  @override
  Future<List<PesquisaResultado>> pesquisar(String textoPesquisa) async {
    try {
      final resultado = await dataSource.pesquisar(textoPesquisa);
      return resultado;
    } catch (e) {
      throw DataSourceException();
    }
  }
}
