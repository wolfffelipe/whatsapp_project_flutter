class Conversa {
  String? _nome;
  String? _msg;
  String? _caminhoFoto;

  Conversa(this._nome, this._msg, this._caminhoFoto);

  String get nome => _nome!;
  String get msg => _msg!;
  String get caminhoFoto => _caminhoFoto!;

  set nome(String nome) {
    _nome = nome;
  }

  set msg(String msg) {
    _msg = msg;
  }

  set caminhoFoto(String caminhoFoto) {
    _caminhoFoto = caminhoFoto;
  }
}
