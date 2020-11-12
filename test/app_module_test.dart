import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/app_module.dart';
import 'package:flutter_clean_arch/modules/pesquisa/domain/model/pesquisa_resultado.dart';
import 'package:flutter_clean_arch/modules/pesquisa/domain/usecases/pesquisa_por_texto.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'modules/pesquisa/external/datasources/github_datasource_test.dart';
import 'modules/pesquisa/utils/github_response.dart';

class DioMocl extends Mock implements Dio {}

main() {
  final dio = DioMock();

  initModule(AppModule(), changeBinds: [
    Bind<Dio>((i) => dio),
  ]);

  test("deve recuperar o usecase sem erro", () {
    final usecase = Modular.get<PesquisaPorTexto>();

    //expect(usecase, isA<PesquisaPorTexto>());
    expect(usecase, isA<PesquisaPorTextoImpl>());
  });

  test("deve trazer uma lista de PesquisaResultado", () async {
    when(dio.get(any)).thenAnswer((_) async => Response(data: jsonDecode(githubResult), statusCode: 200));

    final usecase = Modular.get<PesquisaPorTexto>();
    final result = await usecase.executar("rapha");

    expect(result, isA<List<PesquisaResultado>>());
  });
}
