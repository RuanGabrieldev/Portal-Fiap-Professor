import 'package:portal_fiap_professor/models/alunos_model.dart';
import 'package:portal_fiap_professor/repository/database_helper.dart';
import 'package:sqflite/sqflite.dart';
 
class AlunoRepository {

  final String _tabela = "alunosModel";
  final String _idRm = "id_aluno";
  final String _foto = "foto";
  final String _nome = "nome";
  final String _turma = "turma_id";

  // Instancia do Database Helper
  DatabaseHelper _databaseHelper;
 
  // Construtor
  AlunoRepository() {
    _databaseHelper = new DatabaseHelper();
  }

  Future<AlunosModel> saveAluno(AlunosModel alunosModel) async{
    var connection = await _databaseHelper.connection;
    alunosModel.rm = await connection.insert(_tabela, alunosModel.toMap());
    return alunosModel;
  }

  Future<AlunosModel> getAluno(String id) async{
    var connection = await _databaseHelper.connection;
    List<Map> alunos = await connection.query(_tabela, 
    columns: [_idRm, _foto, _nome, _turma, "login_id"],
     where: "login_id = ?",
     whereArgs: [id]);
     return alunos.length > 0 ? AlunosModel.fromMap(alunos.first) : null;
  }

  Future<int> updateAluno(AlunosModel alunosModel) async{
    var connection = await _databaseHelper.connection;
    return await connection.update(
      _tabela,
      alunosModel.toMap(),
      where: "$_idRm = ?",
      whereArgs: [alunosModel.rm]
    );
  }

  Future<List<AlunosModel>> getAllAlunos() async{
    var connection = await _databaseHelper.connection;
    List<Map> maps = await connection.rawQuery("SELECT * FROM $_tabela");
    List<AlunosModel> alunos = maps.map((e) => AlunosModel.fromMap(e)).toList();
    return alunos;
  }

  Future<int> getNumber() async {
    var connection = await _databaseHelper.connection;
    return Sqflite.firstIntValue(await connection.rawQuery("SELECT COUNT(*) FROM $_tabela"));
  }


}