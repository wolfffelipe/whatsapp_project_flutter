import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_project_flutter/Login.dart';
import 'package:whatsapp_project_flutter/RouteGenerator.dart';
import 'package:whatsapp_project_flutter/telas/AbaContatos.dart';
import 'package:whatsapp_project_flutter/telas/AbaConversas.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<String> itensMenu = ["Settings", "Go out!"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  _escolhaMenuItem(String itemEscolhido) {
    switch (itemEscolhido) {
      case "Settings":
        Navigator.pushNamed(context, RouteGenerator.ROTA_CONFIG);
        break;
      case "Go out!":
        _deslogarUsuario();
        break;
    }
  }

  _deslogarUsuario() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();

    Navigator.pushReplacementNamed(context, RouteGenerator.ROTA_LOGIN);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Whatsapp"),
        bottom: TabBar(
            indicatorWeight: 4,
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: "Chats",
              ),
              Tab(
                text: "Contacts",
              ),
            ]),
        actions: [
          PopupMenuButton<String>(
            onSelected: _escolhaMenuItem,
            itemBuilder: (context) {
              return itensMenu.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
          )
        ],
        backgroundColor: Color(0xff075E54),
      ),
      body: TabBarView(controller: _tabController, children: [
        AbaConversas(),
        AbaContatos(),
      ]),
    );
  }
}
