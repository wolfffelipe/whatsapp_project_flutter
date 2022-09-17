<h1>Mensageiro Whatsapp</h1>

![Badge](https://img.shields.io/badge/Dart-green?style=flat-square&logo=Dart&logoColor=white) ![Badge](https://img.shields.io/badge/Flutter-blue?style=flat-square&logo=Flutter&logoColor=white) ![Badge](https://img.shields.io/badge/Firebase-orange?style=flat-square&logo=Firebase&logoColor=white)


<br><br>
🚧 <b>Projeto em construção</b>🚧
<br><br><br>

## 🚀 Começando

Em breve...

<br>

### 📋 Pré-requisitos

Em breve...

<br>

### 🔧 Instalação

Em breve...

<br>

## ⚙️ Configuração do Database

🔸Criação do projeto Flutter
  
🔸Criação de um novo projeto no Firebase

&nbsp;&nbsp;&nbsp;🔹Para buscar o link de geração do projeto vá em: android > app > src > main > AndroidManifest.xml
  
&nbsp;&nbsp;&nbsp;🔹google-services.json (android > app)
  
&nbsp;&nbsp;&nbsp;🔹Seguir o passo a passo da [documentação](https://firebase.google.com/docs/flutter/setup?hl=pt-br&platform=ios) oficial

<br>

&nbsp;&nbsp;&nbsp;🔸Observações...

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;🔹Após logar no Firebase CLI pode voltar ao passo a passo e adicionar as configurações do SDK

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;🔹Opcional => Caso dê erro ao executar o "firebase configure", adicione o caminho que aparecerá no shell do firebase às variáveis de ambiente no "path"

<br>

#### 🔸Adicionar ao pubspec.yaml:
    cupertino_icons: ^1.0.2
    firebase_core: ^1.22.0
    firebase_auth: ^3.8.0
    firebase_storage: ^10.3.8
    cloud_firestore: ^3.4.7
  
#### 🔸Conferir se "gradle.properties" tem as linhas:
    android.useAndroidX=true
    android.enableJetifier=true


#### 🔸Conferir se no "build.gradle" da pasta "app" 

&nbsp;&nbsp;&nbsp;🔹Existe a linha "multiDexEnabled true" em "DefaultConfig"

&nbsp;&nbsp;&nbsp;🔹E se as seguintes linhas estão preenchidas:

    minSdkVersion 21
    targetSdkVersion 30

#### 🔸Configurar o Cloud Firestore no console do Firebase

#### 🔸No arquivo "main.dart" importar os pacotes que serão utilizados e inicializar o Firebase:
    import 'package:firebase_core/firebase_core.dart';
    [...]

    Future main() async {
        WidgetsFlutterBinding.ensureInitialized();
        await Firebase.initializeApp();
    [...]

#### 🔸Tem um resumo muito bom desta configuração no canal do Johannes, [dá uma olhada](https://www.youtube.com/watch?v=sz4slPFwEvs&ab_channel=JohannesMilke)



<br>

## 📦 Implantação

Em breve...

<br>

## 🛠️ Referências

* [Dart](https://rometools.github.io/rome/) - Linguagem
* [Flutter](https://rometools.github.io/rome/) - Framework
* [Firebase](https://maven.apache.org/) - Database
* [Visual Studio Code](https://code.visualstudio.com/) - IDE
* [Pub Dev](https://pub.dev/) - Repositório Dart e Flutter

<!--
## 📌 Versão

Nós usamos [SemVer](http://semver.org/) para controle de versão. Para as versões disponíveis, observe as [repo](link). 
-->

<br>

# ✒️ Autores
<center>
<img src="https://avatars.githubusercontent.com/u/6557712?v=4" width=100>

⌨️ com 🤍 por [Felipe Wolff](https://gist.github.com/wolfffelipe)

<br>

<font color="grey">
<!--
##### Você também pode ver a lista de todos os [colaboradores](https://github.com/usuario/projeto/colaboradores) que participaram deste projeto.
-->
</font>

</center>