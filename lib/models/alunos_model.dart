import 'dart:convert';
 
import 'package:portal_fiap_professor/models/presenca_model.dart';
import 'package:portal_fiap_professor/models/turmas_model.dart';
 
class AlunosModel {
  int rm;
  String foto;
  String nome;
  List<PresencaModel> presenca;
  int turmasModel;
  
 
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
    return AlunosModel(
        rm: json["RM"],
        foto: json["foto"],
        nome: json["nome"],
        presenca: null,
        turmasModel: json["turma_id"],
      );
  }

  Map<String, dynamic> toMap() => {
        "RM": rm,
        "foto": foto,
        "nome": nome,
        "turmasModel": turmasModel,
      };
}
