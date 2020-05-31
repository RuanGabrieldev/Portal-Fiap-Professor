import 'dart:convert';

import 'package:portal_fiap_professor/models/materias_model.dart';
import 'package:portal_fiap_professor/models/turmas_model.dart';


class ProfessorModel {
  int pf;
  String nomeProfessor;
  String foto;
  List<TurmasModel> turmas;
  List<MateriasModel> materias;

  ProfessorModel({
    this.pf,
    this.nomeProfessor,
    this.foto,
    this.turmas,
    this.materias,
  });

  factory ProfessorModel.fromJson(String str) => ProfessorModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProfessorModel.fromMap(Map<String, dynamic> json) => ProfessorModel(
    pf: json["pf"],
    nomeProfessor: json["nomeProfessor"],
    foto: json["foto"],
    turmas: List<TurmasModel>.from(json["turmas"].map((x) => TurmasModel.fromMap(x))),
    materias: List<MateriasModel>.from(json["materias"].map((x) => MateriasModel.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "pf": pf,
    "nomeProfessor": nomeProfessor,
    "foto": foto,
    "turmas": List<dynamic>.from(turmas.map((x) => x.toMap())),
    "materias": List<dynamic>.from(materias.map((x) => x.toMap())),
  };
}

