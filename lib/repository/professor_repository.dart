import 'package:portal_fiap_professor/models/professor_model.dart';
import 'package:portal_fiap_professor/repository/database_helper.dart';
import 'package:sqflite/sqflite.dart';

class ProfessorRepository {
  final String _tabela = "professoresModel";
  final String _idPf = "id_professor";
  final String _foto = "foto";
  final String _nome = "nome_professor";

  // Instancia do Database Helper
  DatabaseHelper _databaseHelper;

  // Construtor
  ProfessorRepository() {
    _databaseHelper = new DatabaseHelper();
  }

  Future<ProfessorModel> saveProfessor(ProfessorModel professoresModel) async {
    var connection = await _databaseHelper.connection;
    professoresModel.pf =
        await connection.insert(_tabela, professoresModel.toMap());
    return professoresModel;
  }

  Future<ProfessorModel> getProfessor(String id) async {
    var connection = await _databaseHelper.connection;
    List<Map> professores = await connection.query(_tabela,
        columns: [_idPf, _foto, _nome, "login_id"],
        where: "login_id = ?",
        whereArgs: [id]);
    return professores.length > 0
        ? ProfessorModel.fromMap(professores.first)
        : null;
  }

  Future<int> updateProfessor(ProfessorModel professoresModel) async {
    var connection = await _databaseHelper.connection;
    return await connection.update(_tabela, professoresModel.toMap(),
        where: "$_idPf = ?", whereArgs: [professoresModel.pf]);
  }

  Future<List<ProfessorModel>> getAllProfessor() async {
    var connection = await _databaseHelper.connection;
    List<Map> maps = await connection.rawQuery("SELECT * FROM $_tabela");
    List<ProfessorModel> professores =
        maps.map((e) => ProfessorModel.fromMap(e)).toList();
    return professores;
  }

  Future<int> getNumber() async {
    var connection = await _databaseHelper.connection;
    return Sqflite.firstIntValue(
        await connection.rawQuery("SELECT COUNT(*) FROM $_tabela"));
  }
}
