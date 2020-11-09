abstract class PesquisaException implements Exception {}

class TextoInvalidoException implements PesquisaException {}

class DataSourceException implements PesquisaException {
  final String mensagem;

  DataSourceException({this.mensagem});
}
