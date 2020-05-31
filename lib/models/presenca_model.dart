import 'dart:convert';

class PresencaModel {
  int idPresenca;
  String nomeAula;
  String dataAula;
  bool presente;
  String comentarios;

  PresencaModel({
    this.idPresenca,
    this.nomeAula,
    this.dataAula,
    this.presente,
    this.comentarios,
  });

  factory PresencaModel.fromJson(String str) => PresencaModel.fromMap(json.decode(str));

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
