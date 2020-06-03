import 'package:portal_fiap_professor/models/turmas_model.dart';
import 'package:portal_fiap_professor/repository/database_helper.dart';
import 'package:sqflite/sqflite.dart';
 
class TurmaRepository {

  final String _tabela = "turmasModel";
  final String _idTurma = "id_turma";
  final String _nomeCurso = "nome_turma";
  final String _tipoCurso = "tipo_curso";
  final String _anoCurso = "ano_curso";
  final String _turnoCurso = "turno_curso";
  final String _profesorId = "professor_id";


  // Instancia do Database Helper
  DatabaseHelper _databaseHelper;
 
  // Construtor
  TurmaRepository() {
    _databaseHelper = new DatabaseHelper();
  }

  Future<TurmasModel> saveTurma(TurmasModel turmasModel) async{
    var connection = await _databaseHelper.connection;
    turmasModel.idTurma = await connection.insert(_tabela, turmasModel.toMap());
    return turmasModel;
  }

  Future<TurmasModel> getTurma(int id) async{
    var connection = await _databaseHelper.connection;
    List<Map> turma = await connection.query(_tabela, 
    columns: [_idTurma, _tipoCurso, _anoCurso, _turnoCurso, _nomeCurso, _profesorId],
     where: "$_idTurma = ?",
     whereArgs: [id]);
     return turma.length > 0 ? TurmasModel.fromMap(turma.first) : null;
  }

  Future<int> updateTurma(TurmasModel turmaModel) async{
    var connection = await _databaseHelper.connection;
    return await connection.update(
      _tabela,
      turmaModel.toMap(),
      where: "$_idTurma = ?",
      whereArgs: [turmaModel.idTurma]
    );
  }

  Future<List<TurmasModel>> getAllTurma() async{
    var connection = await _databaseHelper.connection;
    List<Map> maps = await connection.rawQuery("SELECT * FROM $_tabela");
    List<TurmasModel> turmas = maps.map((e) => TurmasModel.fromMap(e)).toList();
    return turmas;
  }

  Future<int> getNumber() async {
    var connection = await _databaseHelper.connection;
    return Sqflite.firstIntValue(await connection.rawQuery("SELECT COUNT(*) FROM $_tabela"));
  }


}
