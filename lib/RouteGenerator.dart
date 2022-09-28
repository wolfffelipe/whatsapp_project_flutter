import 'package:flutter/material.dart';
import 'package:whatsapp_project_flutter/Cadastro.dart';
import 'package:whatsapp_project_flutter/Configuracoes.dart';
import 'package:whatsapp_project_flutter/Home.dart';
import 'package:whatsapp_project_flutter/Login.dart';

class RouteGenerator {
  static const String ROTA_HOME = "/home";
  static const String ROTA_LOGIN = "/login";
  static const String ROTA_CADASTRO = "/cadastro";
  static const String ROTA_CONFIG = "/config";
  //static const String ROTA_RAIZ = "/";

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //case ROTA_RAIZ:
      //  return MaterialPageRoute(builder: (context) => Login());
      case ROTA_LOGIN:
        return MaterialPageRoute(builder: (context) => Login());
      case ROTA_HOME:
        return MaterialPageRoute(builder: (context) => Home());
      case ROTA_CADASTRO:
        return MaterialPageRoute(builder: (context) => Cadastro());
      case ROTA_CONFIG:
        return MaterialPageRoute(builder: (context) => Configuracoes());
      default:
        _erroRota();
    }
    return null;
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(title: Text("Erro")),
          body: Center(
            child: Text("Tela não encontrada"),
          ));
    });
  }
}
