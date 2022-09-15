import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xff075E54)),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset(
                    "imgs/logo.png",
                    width: 200,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: TextField(
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "e-mail",
                        hintStyle: TextStyle(color: Colors.white30),
                        filled: false,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                      hintText: "senha",
                      hintStyle: TextStyle(color: Colors.white30),
                      filled: false,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: ElevatedButton(
                    onPressed: () => {print("teste")},
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 66, 145, 76),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        shadowColor: Colors.green,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                  ),
                ),
                Center(
                  child: TextButton(
                      onPressed: () => {print("teste")},
                      child: Text(
                        "Cadastre-se",
                        style: TextStyle(color: Colors.white24),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
