import 'dart:convert';

class TurmasModel {
  int idTurma;
  String tipoCurso;
  String anoCurso;
  String turnoCurso;

  TurmasModel({
    this.idTurma,
    this.tipoCurso,
    this.anoCurso,
    this.turnoCurso,
  });

  factory TurmasModel.fromJson(String str) =>
      TurmasModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TurmasModel.fromMap(Map<String, dynamic> json) => TurmasModel(
    idTurma: json["id_turma"],
    tipoCurso: json["tipo_curso"],
    anoCurso: json["ano_curso"],
    turnoCurso: json["turno_curso"],
  );

  Map<String, dynamic> toMap() => {
    "id_turma": idTurma,
    "tipo_curso": tipoCurso,
    "ano_curso": anoCurso,
    "turno_curso": turnoCurso,
  };
}
