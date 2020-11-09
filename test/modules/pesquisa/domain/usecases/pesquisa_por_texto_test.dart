import 'package:flutter_clean_arch/modules/pesquisa/domain/errors/exceptions.dart';
import 'package:flutter_clean_arch/modules/pesquisa/domain/model/pesquisa_resultado.dart';
import 'package:flutter_clean_arch/modules/pesquisa/domain/repositories/pesquisa_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_arch/modules/pesquisa/domain/usecases/pesquisa_por_texto.dart';
import 'package:mockito/mockito.dart';

class PesquisaRepositoryMock extends Mock implements PesquisaRepository {}

main() {
  final repository = PesquisaRepositoryMock();
  final usecase = PesquisaPorTextoImpl(repository);
  test("deve retornar uma lista de PesquisaResultado", () async {
    when(repository.pesquisar(any)).thenAnswer((_) async => <PesquisaResultado>[]);

    final resultado = await usecase.executar("rapha");
    expect(resultado, isA<List<PesquisaResultado>>());
  });

  test("deve retornar uma PesquisaTextoInvalidoException caso o texto seja inválido", () async {
    when(repository.pesquisar(any)).thenAnswer((_) async => <PesquisaResultado>[]);

    Function resultado = () async => await usecase.executar(null);
    expect(resultado, throwsA(isA<TextoInvalidoException>()));

    resultado = () async => await usecase.executar("");
    expect(resultado, throwsA(isA<TextoInvalidoException>()));
  });
}
