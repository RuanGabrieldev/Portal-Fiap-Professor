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
    pf: json["id_professor"],
    nomeProfessor: json["nome_professor"],
    foto: json["foto"],
    turmas: null,
    materias: null,
  );

  Map<String, dynamic> toMap() => {
    "pf": pf,
    "nomeProfessor": nomeProfessor,
    "foto": foto,
    "turmas": List<dynamic>.from(turmas.map((x) => x.toMap())),
    "materias": List<dynamic>.from(materias.map((x) => x.toMap())),
  };
}

