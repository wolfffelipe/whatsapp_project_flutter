class Usuario {
  String? _nome;
  String? _email;
  String? _senha;

  Usuario();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {"nome": this.nome, "email": this.email};

    return map;
  }

  String get nome => _nome!;
  String get email => _email!;
  String get senha => _senha!;

  set nome(String nome) {
    _nome = nome;
  }

  set email(String email) {
    _email = email;
  }

  set senha(String senha) {
    _senha = senha;
  }
}
