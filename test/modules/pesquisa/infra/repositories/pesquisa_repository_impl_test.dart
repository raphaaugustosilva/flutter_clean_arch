import 'package:flutter_clean_arch/modules/pesquisa/domain/errors/exceptions.dart';
import 'package:flutter_clean_arch/modules/pesquisa/domain/model/pesquisa_resultado.dart';
import 'package:flutter_clean_arch/modules/pesquisa/infra/datasources/pesquisa_datasource.dart';
import 'package:flutter_clean_arch/modules/pesquisa/infra/models/pesquisa_resultado_model.dart';
import 'package:flutter_clean_arch/modules/pesquisa/infra/repositories/pesquisa_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class PesquisaDataSourceMock extends Mock implements PesquisaDataSource {}

main() {
  final datasource = PesquisaDataSourceMock();
  final repository = PesquisaRepositoryImpl(datasource);

  test("Deve retornar uma lista de PesquisaResultado", () async {
    when(datasource.pesquisar(any)).thenAnswer((_) async => <PesquisaResultadoModel>[]);
    final resultado = await repository.pesquisar("rapha");
    expect(resultado, isA<List<PesquisaResultado>>());
  });

  test("Deve retornar um DataSourceException se o datasource falhar", () async {
    when(datasource.pesquisar(any)).thenThrow(Exception());
    Function resultado = () async => await repository.pesquisar("rapha");
    expect(resultado, throwsA(isA<DataSourceException>()));
  });
}
