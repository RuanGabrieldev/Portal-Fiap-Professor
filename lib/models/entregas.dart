import 'dart:convert';

import 'package:podeapagar/model/Alunos.dart';
import 'package:podeapagar/model/Professor_model.dart';
import 'package:podeapagar/model/Turmas.dart';

class EntregasModel {
  int codigo;
  String nomeTrabalho;
  String tema;
  String descricao;
  double percentualEnvios;
  int quantidadeGrupoMax;
  int dataEntrega;
  List<AlunosModel> alunos;
  List<TurmasModel> turmas;
  ProfessorModel professor;

  EntregasModel({
    this.codigo,
    this.nomeTrabalho,
    this.tema,
    this.descricao,
    this.percentualEnvios,
    this.quantidadeGrupoMax,
    this.dataEntrega,
    this.alunos,
    this.turmas,
    this.professor,
  });

  factory EntregasModel.fromJson(String str) => EntregasModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EntregasModel.fromMap(Map<String, dynamic> json) => EntregasModel(
    codigo: json["Codigo"],
    nomeTrabalho: json["nomeTrabalho"],
    tema: json["tema"],
    descricao: json["descricao"],
    percentualEnvios: json["percentualEnvios"].toDouble(),
    quantidadeGrupoMax: json["quantidadeGrupoMax"],
    dataEntrega: json["dataEntrega"],
    alunos: List<AlunosModel>.from(json["alunos"].map((x) => Aluno.fromMap(x))),
    turmas: List<TurmasModel>.from(json["turmas"].map((x) => Turma.fromMap(x))),
    professor: ProfessorModel.fromMap(json["professor"]),
  );

  Map<String, dynamic> toMap() => {
    "Codigo": codigo,
    "nomeTrabalho": nomeTrabalho,
    "tema": tema,
    "descricao": descricao,
    "percentualEnvios": percentualEnvios,
    "quantidadeGrupoMax": quantidadeGrupoMax,
    "dataEntrega": dataEntrega,
    "alunos": List<dynamic>.from(alunos.map((x) => x.toMap())),
    "turmas": List<dynamic>.from(turmas.map((x) => x.toMap())),
    "professor": professor.toMap(),
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

class Professor {
  int rm;
  String nomeProfessor;
  String senha;
  String foto;
  List<Turma> turmas;
  List<Materia> materias;

  Professor({
    this.rm,
    this.nomeProfessor,
    this.senha,
    this.foto,
    this.turmas,
    this.materias,
  });

  factory Professor.fromJson(String str) => Professor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Professor.fromMap(Map<String, dynamic> json) => Professor(
    rm: json["RM"],
    nomeProfessor: json["nomeProfessor"],
    senha: json["senha"],
    foto: json["foto"],
    turmas: List<Turma>.from(json["turmas"].map((x) => Turma.fromMap(x))),
    materias: List<Materia>.from(json["materias"].map((x) => Materia.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "RM": rm,
    "nomeProfessor": nomeProfessor,
    "senha": senha,
    "foto": foto,
    "turmas": List<dynamic>.from(turmas.map((x) => x.toMap())),
    "materias": List<dynamic>.from(materias.map((x) => x.toMap())),
  };
}

class Materia {
  int idMaterias;
  String nome;
  int quantidadeAula;

  Materia({
    this.idMaterias,
    this.nome,
    this.quantidadeAula,
  });

  factory Materia.fromJson(String str) => Materia.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Materia.fromMap(Map<String, dynamic> json) => Materia(
    idMaterias: json["idMaterias"],
    nome: json["nome"],
    quantidadeAula: json["quantidadeAula"],
  );

  Map<String, dynamic> toMap() => {
    "idMaterias": idMaterias,
    "nome": nome,
    "quantidadeAula": quantidadeAula,
  };
}

class Turma {
  int idTurma;
  String tipoCurso;
  String anoCurso;
  int quantidaDeAlunos;
  List<Aluno> alunos;

  Turma({
    this.idTurma,
    this.tipoCurso,
    this.anoCurso,
    this.quantidaDeAlunos,
    this.alunos,
  });

  factory Turma.fromJson(String str) => Turma.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Turma.fromMap(Map<String, dynamic> json) => Turma(
    idTurma: json["idTurma"],
    tipoCurso: json["TipoCurso"],
    anoCurso: json["anoCurso"],
    quantidaDeAlunos: json["quantidaDeAlunos"],
    alunos: List<Aluno>.from(json["alunos"].map((x) => Aluno.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "idTurma": idTurma,
    "TipoCurso": tipoCurso,
    "anoCurso": anoCurso,
    "quantidaDeAlunos": quantidaDeAlunos,
    "alunos": List<dynamic>.from(alunos.map((x) => x.toMap())),
  };
}
