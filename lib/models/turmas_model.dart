import 'dart:convert';

class TurmasModel {
  int idTurma;
  String tipoCurso;
  String nomeTurma;
  String anoCurso;
  String turnoCurso;
  int professorId;

  TurmasModel(
      {this.idTurma,
      this.tipoCurso,
      this.nomeTurma,
      this.anoCurso,
      this.turnoCurso,
      this.professorId});

  factory TurmasModel.fromJson(String str) =>
      TurmasModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TurmasModel.fromMap(Map<String, dynamic> json) => TurmasModel(
        idTurma: json["id_turma"],
        tipoCurso: json["tipo_curso"],
        nomeTurma: json["nome_turma"],
        anoCurso: json["ano_curso"],
        turnoCurso: json["turno_curso"],
        professorId: json["professor_id"],
      );

  Map<String, dynamic> toMap() => {
        "id_turma": idTurma,
        "tipo_curso": tipoCurso,
        "ano_curso": anoCurso,
        "turno_curso": turnoCurso,
        "professor_id": professorId,
        "nome_turma": nomeTurma,
      };
}
