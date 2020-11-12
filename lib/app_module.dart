import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_arch/app_widget.dart';
import 'package:flutter_clean_arch/modules/pesquisa/domain/usecases/pesquisa_por_texto.dart';
import 'package:flutter_clean_arch/modules/pesquisa/external/datasources/github_datasource.dart';
import 'package:flutter_clean_arch/modules/pesquisa/infra/repositories/pesquisa_repository_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => GitHubDataSource(i())),
        Bind((i) => PesquisaRepositoryImpl(i())),
        Bind((i) => PesquisaPorTextoImpl(i())),
      ];

  @override
  List<ModularRouter> get routers => throw UnimplementedError();

  @override
  Widget get bootstrap => AppWidget();
}
