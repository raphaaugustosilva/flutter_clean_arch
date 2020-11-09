import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/modules/pesquisa/domain/errors/exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../utils/github_response.dart';
import 'package:flutter_clean_arch/modules/pesquisa/external/datasources/github_datasource.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();
  final datasource = GitHubDataSource(dio);
  test("deve retornar uma lista de PesquisaResultadoModel", () async {
    when(dio.get(any)).thenAnswer((_) async => Response(data: jsonDecode(githubResult), statusCode: 200));
    Future resultado = datasource.pesquisar("rapha");
    expect(resultado, completes);
  });

  test("deve retornar um erro se o código não for 200", () async {
    when(dio.get(any)).thenAnswer((_) async => Response(data: null, statusCode: 401));

    Future resultado = datasource.pesquisar("rapha");
    expect(resultado, throwsA(isA<DataSourceException>()));
  });

  test("deve retornar um Exception se tiver um erro no dio", () async {
    when(dio.get(any)).thenThrow(Exception());
    Future resultado = datasource.pesquisar("rapha");
    expect(resultado, throwsA(isA<Exception>()));
  });
}
