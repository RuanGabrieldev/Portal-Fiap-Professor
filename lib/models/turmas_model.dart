import 'dart:convert';

import 'package:portal_fiap_professor/models/alunos_model.dart';



class TurmasModel {
  int idTurma;
  String tipoCurso;
  String anoCurso;
  int quantidaDeAlunos;
  List<AlunosModel> alunos;

  TurmasModel({
    this.idTurma,
    this.tipoCurso,
    this.anoCurso,
    this.quantidaDeAlunos,
    this.alunos,
  });

  factory TurmasModel.fromJson(String str) => TurmasModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TurmasModel.fromMap(Map<String, dynamic> json) => TurmasModel(
    idTurma: json["idTurma"],
    tipoCurso: json["TipoCurso"],
    anoCurso: json["anoCurso"],
    quantidaDeAlunos: json["quantidaDeAlunos"],
    alunos: List<AlunosModel>.from(json["alunos"].map((x) => Aluno.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "idTurma": idTurma,
    "TipoCurso": tipoCurso,
    "anoCurso": anoCurso,
    "quantidaDeAlunos": quantidaDeAlunos,
    "alunos": List<dynamic>.from(alunos.map((x) => x.toMap())),
  };
}

class Aluno {
  int rm;
  String foto;
  String nome;
  List<Presenca> presenca;

  Aluno({
    this.rm,
    this.foto,
    this.nome,
    this.presenca,
  });

  factory Aluno.fromJson(String str) => Aluno.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Aluno.fromMap(Map<String, dynamic> json) => Aluno(
    rm: json["RM"],
    foto: json["foto"],
    nome: json["nome"],
    presenca: List<Presenca>.from(json["presenca"].map((x) => Presenca.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "RM": rm,
    "foto": foto,
    "nome": nome,
    "presenca": List<dynamic>.from(presenca.map((x) => x.toMap())),
  };
}

class Presenca {
  int idPreseca;
  String nomeAula;
  String dataAula;
  bool presente;
  String comentarios;

  Presenca({
    this.idPreseca,
    this.nomeAula,
    this.dataAula,
    this.presente,
    this.comentarios,
  });

  factory Presenca.fromJson(String str) => Presenca.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Presenca.fromMap(Map<String, dynamic> json) => Presenca(
    idPreseca: json["idPreseca"],
    nomeAula: json["nomeAula"],
    dataAula: json["dataAula"],
    presente: json["presente"],
    comentarios: json["Comentarios"],
  );

  Map<String, dynamic> toMap() => {
    "idPreseca": idPreseca,
    "nomeAula": nomeAula,
    "dataAula": dataAula,
    "presente": presente,
    "Comentarios": comentarios,
  };
}
