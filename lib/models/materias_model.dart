import 'dart:convert';

class MateriasModel {
  int idMaterias;
  String nome;
  String quantidadeAula;

  MateriasModel({
    this.idMaterias,
    this.nome,
    this.quantidadeAula,
  });

  factory MateriasModel.fromJson(String str) => MateriasModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MateriasModel.fromMap(Map<String, dynamic> json) => MateriasModel(
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
