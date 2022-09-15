import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_project_flutter/Home.dart';
import 'package:whatsapp_project_flutter/Login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  /*
  FirebaseFirestore.instance
      .collection("usuarios")
      .doc("001")
      .set({"nome": "felipe"});
  */

  runApp(MaterialApp(
    home: Login(),
    theme: ThemeData(
      primaryColor: Color(0xff075E54),
      //accentColor: Color(0xff075E54),
    ),
    debugShowCheckedModeBanner: false,
  ));
}

/*
  1.    Criação do projeto Flutter
  
  2.    Criação de um novo projeto no Firebase
  
  2.1.  Para buscar o link: android > app > src > main > AndroidManifest.xml
  
  2.2.  google-services.json (android > app)
  
  2.3.  Seguir o passo a passo da documentação oficial:
        https://firebase.google.com/docs/flutter/setup?hl=pt-br&platform=ios
        
        (obs.: Após logar no Firebase CLI pode voltar ao passo a passo e adicionar as configurações do SDK)
        (obs.: Opcional? => Caso dê erro ao executar o "firebase configure", adicione o caminho
        que aparecerá no shell do firebase às variáveis de ambiente no "path")
  
  3.    Adicionar ao pubspec.yaml:
          cupertino_icons: ^1.0.2
          firebase_core: ^1.22.0
          firebase_auth: ^3.8.0
          firebase_storage: ^10.3.8
          cloud_firestore: ^3.4.7
  
  4.    Conferir se "gradle.properties" tem as linhas:
          android.useAndroidX=true
          android.enableJetifier=true

  5.    Conferir de no "build.gradle" da pasta "app" 
        - Se existe a linha "multiDexEnabled true" em "DefaultConfig"
        - minSdkVersion 21
        - targetSdkVersion 30

  6.    Configurar o Cloud Firestore no console do Firebase

  7.    No main.dart:
        import 'package:firebase_core/firebase_core.dart';

        Future main() async {
          WidgetsFlutterBinding.ensureInitialized();
          await Firebase.initializeApp();
        [...]

  Resumo:
  https://www.youtube.com/watch?v=sz4slPFwEvs&ab_channel=JohannesMilke
*/