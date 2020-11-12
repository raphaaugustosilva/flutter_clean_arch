import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/modules/pesquisa/domain/errors/exceptions.dart';
import 'package:flutter_clean_arch/modules/pesquisa/infra/datasources/pesquisa_datasource.dart';
import 'package:flutter_clean_arch/modules/pesquisa/infra/models/pesquisa_resultado_model.dart';

extension on String {
  normalize() {
    return this.replaceAll(" ", "+");
  }
}

class GitHubDataSource implements PesquisaDataSource {
  final Dio dio;
  GitHubDataSource(this.dio);

  @override
  Future<List<PesquisaResultadoModel>> pesquisar(String textoPesquisa) async {
    final response = await dio.get("https://api.github.com/search/users?q=${textoPesquisa.normalize()}");
    if (response.statusCode == 200) {
      var jsonList = response.data['items'] as List;
      var list = jsonList
          .map((item) => PesquisaResultadoModel(
                id: item['id'].toString(),
                apelido: item['login'],
                imagem: item['avatar_url'],
                url: item['url'],
              ))
          .toList();

      return list;
    } else {
      throw DataSourceException();
    }
  }
}
