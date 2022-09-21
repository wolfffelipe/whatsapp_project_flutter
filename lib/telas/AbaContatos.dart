import 'package:flutter/material.dart';
import 'package:whatsapp_project_flutter/model/Conversa.dart';

class AbaContatos extends StatefulWidget {
  const AbaContatos({Key? key}) : super(key: key);

  @override
  State<AbaContatos> createState() => _AbaContatosState();
}

class _AbaContatosState extends State<AbaContatos> {
  List<Conversa> listaConversas = [
    Conversa("Fulano", "Olá",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-280ea.appspot.com/o/perfil%2Fperfil1.jpg?alt=media&token=88d7b7ff-bc02-4aa6-a278-0962d4ed5ded"),
    Conversa("Ciclano", "Olááá!",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-280ea.appspot.com/o/perfil%2Fperfil3.jpg?alt=media&token=3d17152a-5870-4bd2-84ae-8c76d28cffc8"),
    Conversa("Beltrano", "Fala tu",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-280ea.appspot.com/o/perfil%2Fperfil2.jpg?alt=media&token=d1943dde-dbb0-414d-abcf-ff3cf50e477c"),
    Conversa("Rio", "Bom dia",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-280ea.appspot.com/o/perfil%2Fperfil4.jpg?alt=media&token=4a99a6be-196b-42de-8f4a-45996b07e42a"),
    Conversa("Ostras", "E aííí",
        "https://firebasestorage.googleapis.com/v0/b/whatsapp-280ea.appspot.com/o/perfil%2Fperfil5.jpg?alt=media&token=d29978b2-34f0-47a0-97ca-bc6fb0ab02de"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listaConversas.length,
        itemBuilder: (context, indice) {
          Conversa conversa = listaConversas[indice];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            leading: CircleAvatar(
              maxRadius: 28,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(conversa.caminhoFoto),
            ),
            title: Text(
              conversa.nome,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
