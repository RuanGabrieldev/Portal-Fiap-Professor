import 'dart:convert';

class LoginModel {
    
    String login;
    String senha;
    int nivelAcesso;

    LoginModel({
        this.login,
        this.senha,
        this.nivelAcesso,
    });

    factory LoginModel.fromJson(String str) => LoginModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        login: json["login"],
        senha: json["senha"],
        nivelAcesso: json["nivel_acesso"],
    );

    Map<String, dynamic> toMap() => {
        "login": login,
        "senha": senha,
        "nivel_cesso": nivelAcesso,
    };
}
