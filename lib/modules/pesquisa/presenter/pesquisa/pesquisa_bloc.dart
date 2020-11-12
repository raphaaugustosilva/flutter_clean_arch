import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_clean_arch/modules/pesquisa/domain/usecases/pesquisa_por_texto.dart';
import 'package:flutter_clean_arch/modules/pesquisa/presenter/pesquisa/states/state.dart';

class PesquisaBloc extends Bloc<String, PesquisaState> {
  final PesquisaPorTexto usecase;
  PesquisaBloc(this.usecase) : super(PesquisaInicia());

  @override
  Stream<PesquisaState> mapEventToState(String pesquisaTexto) async* {
    try {
      yield PesquisaCarregando();

      final result = await usecase.executar(pesquisaTexto);
      yield PesquisaSucesso(result);
    } catch (e) {
      yield PesquisaErro(e);
    }
  }

  @override
  Stream<Transition<String, PesquisaState>> transformEvents(Stream<String> events, transitionFn) {
    return super.transformEvents(events.debounceTime(Duration(milliseconds: 800)), transitionFn);
  }
}
