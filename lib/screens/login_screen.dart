import 'package:flutter/material.dart';
import 'package:portal_fiap_professor/components/input_field.dart';
import 'package:portal_fiap_professor/models/login_model.dart';
import 'package:portal_fiap_professor/repository/aluno_repository.dart';
import 'package:portal_fiap_professor/repository/login_repository.dart';
import 'package:portal_fiap_professor/repository/professor_repository.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerLogin = TextEditingController();
    TextEditingController controllerPass = TextEditingController();

    ProfessorRepository professorRepository = ProfessorRepository();
    AlunoRepository alunoRepository = AlunoRepository();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.transparent,
      body: Container(
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
                          controller: controllerLogin,
                          icon: Icons.person,
                          label: "Login",
                          hint: "Digite seu login",
                          obscure: false,
                        ),
                      ),
                    ),
                    Divider(),
                    Material(
                      color: Colors.transparent,
                      child: Container(
                        child: InputField(
                          controller: controllerPass,
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
                        child: Container(
                          margin: EdgeInsets.only(bottom: 0),
                          width: MediaQuery.of(context).size.width,
                          child: FlatButton(
                            onPressed: () async {
                              LoginRepository repository = LoginRepository();
                              LoginModel loginModel;
                              await repository
                                  .getLogin(
                                      controllerLogin.text, controllerPass.text)
                                  .then((value) => loginModel = value);
                              if (controllerLogin.text.isEmpty ||
                                  controllerPass.text.isEmpty) {
                                onFail(
                                    "É necessário preencher os campos para autenticar");
                              } else if (loginModel != null) {
                                loginModel.login.contains("pf")
                                    ? professorRepository
                                        .getProfessor(loginModel.login)
                                        .then((value) => Navigator.of(context)
                                            .pushReplacementNamed("/cursos",
                                                arguments: value))
                                    : alunoRepository
                                        .getAluno(loginModel.login)
                                        .then((value) => Navigator.of(context)
                                            .pushReplacementNamed("/cursos",
                                                arguments: value));
                              } else {
                                onFail("Usuário ou senha inválido.");
                              }
                            },
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Text(
                              "Entrar",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
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

  void onFail(String msg) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
    ));
  }
}
