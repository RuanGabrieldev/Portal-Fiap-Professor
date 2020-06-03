import 'dart:convert';

import 'package:portal_fiap_professor/models/alunos_model.dart';
import 'package:portal_fiap_professor/models/professor_model.dart';
import 'package:portal_fiap_professor/models/turmas_model.dart';


class EntregasModel {
  int codigo;
  String nomeTrabalho;
  String tema;
  String descricao;
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
    this.quantidadeGrupoMax,
    this.dataEntrega,
    this.professor,
  });

  factory EntregasModel.fromJson(String str) => EntregasModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EntregasModel.fromMap(Map<String, dynamic> json) => EntregasModel(
    codigo: json["Codigo"],
    nomeTrabalho: json["nomeTrabalho"],
    tema: json["tema"],
    descricao: json["descricao"],
    quantidadeGrupoMax: json["quantidadeGrupoMax"],
    dataEntrega: json["dataEntrega"],
    professor: ProfessorModel.fromMap(json["professor"]),
  );

  Map<String, dynamic> toMap() => {
    "Codigo": codigo,
    "nomeTrabalho": nomeTrabalho,
    "tema": tema,
    "descricao": descricao,
    "quantidadeGrupoMax": quantidadeGrupoMax,
    "dataEntrega": dataEntrega,
    "alunos": List<dynamic>.from(alunos.map((x) => x.toMap())),
    "turmas": List<dynamic>.from(turmas.map((x) => x.toMap())),
    "professor": professor.toMap(),
  };



 // alunos: List<AlunosModel>.from(json["alunos"].map((x) => AlunosModel.fromMap(x))),
   // turmas: List<TurmasModel>.from(json["turmas"].map((x) => TurmasModel.fromMap(x))),
}
