import 'dart:convert';

import 'package:portal_fiap_professor/models/alunos_model.dart';
import 'package:portal_fiap_professor/repository/aluno_repository.dart';

class PresencaModel {
  int idPresenca;
  String nomeAula;
  String dataAula;
  bool presente;
  String comentarios;
  AlunosModel alunosModel;

  PresencaModel({
    this.idPresenca,
    this.nomeAula,
    this.dataAula,
    this.presente,
    this.comentarios,
    this.alunosModel,
  });

  factory PresencaModel.fromJson(String str) =>
      PresencaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PresencaModel.fromMap(Map<String, dynamic> json) => PresencaModel(
    idPresenca: json["idPreseca"],
    nomeAula: json["nomeAula"],
    dataAula: json["dataAula"],
    presente: json["presente"],
    comentarios: json["Comentarios"],
  );

  Map<String, dynamic> toMap() => {
    "idPreseca": idPresenca,
    "nomeAula": nomeAula,
    "dataAula": dataAula,
    "presente": presente,
    "Comentarios": comentarios,
  };
}
