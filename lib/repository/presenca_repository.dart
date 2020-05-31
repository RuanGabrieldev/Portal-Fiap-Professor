import 'package:portal_fiap_professor/models/presenca_model.dart';
import 'package:portal_fiap_professor/repository/database_helper.dart';
import 'package:sqflite/sqflite.dart';
 
class PresencaRepository {

  final String _tabela = "presencaModel";
  final String _idPresenca = "id_presenca";
  final String _nome = "nome_aula";
  final String _dataAula  = "data_aula";
  final String _presente  = "presente";
  final String _comentario  = "comentarios";
  final String _aluno  = "aluno";

  // Instancia do Database Helper
  DatabaseHelper _databaseHelper;
 
  // Construtor
  PresencaRepository() {
    _databaseHelper = new DatabaseHelper();
  }

  Future<PresencaModel> savePresenca(PresencaModel presencaModel) async{
    var connection = await _databaseHelper.connection;
    presencaModel.idPresenca = await connection.insert(_tabela, presencaModel.toMap());
    return presencaModel;
  }

  Future<PresencaModel> getPresenca(int id) async{
    var connection = await _databaseHelper.connection;
    List<Map> presenca = await connection.query(
      _tabela, 
      columns: [_idPresenca, _nome, _dataAula, _presente, _comentario, _aluno],
      where: "$_idPresenca = ?",
      whereArgs: [id]);
      return presenca.length > 0 ? PresencaModel.fromMap(presenca.first) : null;
  }

  Future<int> updatePresenca(PresencaModel presencaModel) async{
    var connection = await _databaseHelper.connection;
    return await connection.update(
      _tabela,
      presencaModel.toMap(),
      where: "$_idPresenca = ?",
      whereArgs: [presencaModel.idPresenca]
    );
  }

  Future<List<PresencaModel>> getAllPresenca() async{
    var connection = await _databaseHelper.connection;
    List<Map> maps = await connection.rawQuery("SELECT * FROM $_tabela");
    List<PresencaModel> presenca = maps.map((e) => PresencaModel.fromMap(e)).toList();
    return presenca;
  }

  Future<int> getNumber() async {
    var connection = await _databaseHelper.connection;
    return Sqflite.firstIntValue(await connection.rawQuery("SELECT COUNT(*) FROM $_tabela"));
  }


}