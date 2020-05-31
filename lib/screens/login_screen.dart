import 'package:flutter/material.dart';
import 'package:portal_fiap_professor/components/btn_pattern.dart';
import 'package:portal_fiap_professor/components/input_field.dart';
import 'package:portal_fiap_professor/models/turmas_model.dart';
import 'package:portal_fiap_professor/repository/turma_repository.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center, 
        children: <Widget>[
          Image.asset("fiaplogo.png"),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Form(
              child: Column(
                children: <Widget>[
                  Divider(),

                  //inputs texts de login e senha
                  Material(
                    color: Colors.transparent,
                    child: Container(
                      child: InputField(
                        icon: Icons.person,
                        label: "Email",
                        hint: "Digite seu email",
                        obscure: false,
                      ),
                    ),
                  ),
                  Divider(),
                  Material(
                    color: Colors.transparent,
                    child: Container(
                      child: InputField(
                        icon: Icons.security,
                        label: "Senha",
                        hint: "Digite sua senha",
                        obscure: true,
                      ),
                    ),
                  ),

                  //Texto clicável de esquecimento de senha
                  GestureDetector(
                    onTap: () {
                      print('esqueceu a senha');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Esqueceu sua senha?",
                        style: textStyle(size: 12),
                      ),
                    ),
                  ),

                  //Botão de login
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: BtnPattern(
                      text: "Entrar",
                      route: "/home",
                    ),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  TextStyle textStyle({
    double size = 10,
    font = "Roboto",
  }) {
    return TextStyle(
        decoration: TextDecoration.none,
        color: Color.fromRGBO(237, 20, 91, 1),
        fontSize: size,
        fontFamily: font);
  }
}
