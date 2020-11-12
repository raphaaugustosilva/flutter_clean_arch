import 'package:flutter_clean_arch/modules/pesquisa/domain/errors/exceptions.dart';
import 'package:flutter_clean_arch/modules/pesquisa/domain/model/pesquisa_resultado.dart';
import 'package:flutter_clean_arch/modules/pesquisa/domain/usecases/pesquisa_por_texto.dart';
import 'package:flutter_clean_arch/modules/pesquisa/presenter/pesquisa/pesquisa_bloc.dart';
import 'package:flutter_clean_arch/modules/pesquisa/presenter/pesquisa/states/state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class PesquisaPorTextMock extends Mock implements PesquisaPorTexto {}

main() {
  final usecase = PesquisaPorTextMock();
  final PesquisaBloc bloc = PesquisaBloc(usecase);

  test("deve retornar os estados na ordem correta", () {
    when(usecase.executar(any)).thenAnswer((_) async => <PesquisaResultado>[]);

    expect(
        bloc,
        emitsInOrder([
          isA<PesquisaCarregando>(),
          isA<PesquisaSucesso>(),
        ]));

    bloc.add("rapha");
  });

  test("deve retornar os estados na ordem correta quando der erro", () {
    when(usecase.executar(any)).thenThrow(TextoInvalidoException());

    expect(
        bloc,
        emitsInOrder([
          isA<PesquisaCarregando>(),
          isA<PesquisaErro>(),
        ]));

    bloc.add("rapha");
  });
}
