import 'dart:convert';
 
import 'package:portal_fiap_professor/models/presenca_model.dart';
import 'package:portal_fiap_professor/models/turmas_model.dart';
import 'package:portal_fiap_professor/repository/turma_repository.dart';
 
class AlunosModel {
  int rm;
  String foto;
  String nome;
  List<PresencaModel> presenca;
  TurmasModel turmasModel;
  
 
  AlunosModel({
    this.rm,
    this.foto,
    this.nome,
    this.presenca,
    this.turmasModel
  });
 
  factory AlunosModel.fromJson(String str) =>
      AlunosModel.fromMap(json.decode(str));
 
  String toJson() => json.encode(toMap());
 


  factory AlunosModel.fromMap(Map<String, dynamic> json) {
     TurmaRepository turmaRepository = TurmaRepository();
     

     return AlunosModel(
        rm: json["RM"],
        foto: json["foto"],
        nome: json["nome"],
        presenca: List<PresencaModel>.from(
            json["presenca"]),
        turmasModel: null,
      );
  }





  Map<String, dynamic> toMap() => {
        "RM": rm,
        "foto": foto,
        "nome": nome,
        "presenca": List<dynamic>.from(presenca.map((x) => x.toMap())),
        "turmasModel": turmasModel,
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