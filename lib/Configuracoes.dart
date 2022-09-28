import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;

class Configuracoes extends StatefulWidget {
  const Configuracoes({Key? key}) : super(key: key);

  @override
  State<Configuracoes> createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  final ImagePicker _picker = ImagePicker();
  TextEditingController _controllerNome = TextEditingController();
  XFile? _imagem;

  bool _subindoImagem = false;
  String? _idUsuarioLogado;
  String? _urlImagemRecuperada;

  Future _recuperarImagem(String origemImagem) async {
    XFile? imgSelecionada;

    switch (origemImagem) {
      case "camera":
        imgSelecionada = await _picker.pickImage(source: ImageSource.camera);
        break;
      case "galeria":
        imgSelecionada = await _picker.pickImage(source: ImageSource.gallery);
        break;
    }

    setState(() {
      _imagem = imgSelecionada;
      if (_imagem != null) {
        _uploadImagem();
      }
    });
  }

  // AO SELECIONAR IMAGEM JÁ FAZ O UPLOAD
  Future _uploadImagem() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference raiz = storage.ref();
    Reference arquivo =
        raiz.child("perfil").child(_idUsuarioLogado.toString() + ".jpg");

    UploadTask task = arquivo.putFile(io.File(_imagem!.path));

    task.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
      if (taskSnapshot.state == TaskState.running) {
        setState(() {
          _subindoImagem = true;
        });
      } else if (taskSnapshot.state == TaskState.success) {
        setState(() {
          _subindoImagem = false;
        });
      }
    });

    task.then((TaskSnapshot snapshot) {
      _recuperarUrlImagem(snapshot);
    });
  }

  // RECUPERA URL PARA MOSTRAR ELA NO CIRCLE AVATAR
  Future _recuperarUrlImagem(TaskSnapshot snapshot) async {
    String url = await snapshot.ref.getDownloadURL();

    _atualizarUrlImagemFirestore(url);

    setState(() {
      _urlImagemRecuperada = url;
    });
  }

  // ATUALIZAR URL DA IMAGEM NO DOCUMENTO DO USUÁRIO
  _atualizarUrlImagemFirestore(String url) {
    FirebaseFirestore db = FirebaseFirestore.instance;

    Map<String, dynamic> dadosAtualizar = {"urlImagem": url};

    db.collection("usuarios").doc(_idUsuarioLogado).update(dadosAtualizar);
  }

  // RECUPERA OS DADOS PARA PREENCHER A TELA DE CONFIGURAÇÕES
  _recuperarDadosUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;

    User? usuarioLogado = await auth.currentUser;

    _idUsuarioLogado = usuarioLogado!.uid;

    DocumentSnapshot snapshot =
        await db.collection("usuarios").doc(_idUsuarioLogado).get();

    _controllerNome.text = snapshot.get("nome");

    if (snapshot.get("urlImagem") != null) {
      _urlImagemRecuperada = snapshot.get("urlImagem");
    }
  }

  // ATUALIZANDO NOME
  _atualizarNomeUsuario(String nome) async {
    FirebaseFirestore db = FirebaseFirestore.instance;

    Map<String, dynamic> dadosAtualizar = {"nome": nome};

    db.collection("usuarios").doc(_idUsuarioLogado).update(dadosAtualizar);
  }

  @override
  void initState() {
    _recuperarDadosUsuario();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Configurações"),
        backgroundColor: Color(0xff075E54),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  child:
                      _subindoImagem ? LinearProgressIndicator() : Container(),
                ),
                CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.grey,
                    backgroundImage: _urlImagemRecuperada != null
                        ? NetworkImage(_urlImagemRecuperada!)
                        : NetworkImage(
                            "https://firebasestorage.googleapis.com/v0/b/whatsapp-280ea.appspot.com/o/perfil%2Fsem-foto.jpg?alt=media&token=4bbef10b-8c20-4c97-bf63-522bd877b9d0")),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        _recuperarImagem("camera");
                      },
                      child: Text(
                        "Câmera",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _recuperarImagem("galeria");
                      },
                      child: Text(
                        "Galeria",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    controller: _controllerNome,
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 54, 54, 54)),
                    onChanged: (texto) {
                      _atualizarNomeUsuario(texto);
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "nome",
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: false,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
