
import 'package:portal_fiap_professor/models/materias_model.dart';
import 'package:portal_fiap_professor/models/turmas_model.dart';
import 'package:portal_fiap_professor/repository/database_helper.dart';
import 'package:sqflite/sqflite.dart';
 
class MateriaRepository {

  final String _tabela = "materiaModel";
  final String _idMateria = "id_materias";
  final String _nome = "nome_professor";
  final String _quantidade  = "quantidade_aula";

  // Instancia do Database Helper
  DatabaseHelper _databaseHelper;
 
  // Construtor
  MateriaRepository() {
    _databaseHelper = new DatabaseHelper();
  }

  Future<MateriasModel> saveMateria(MateriasModel materiasModel) async{
    var connection = await _databaseHelper.connection;
    materiasModel.idMaterias = await connection.insert(_tabela, materiasModel.toMap());
    return materiasModel;
  }

  Future<MateriasModel> getMateria(int id) async{
    var connection = await _databaseHelper.connection;
    List<Map> materias = await connection.query(
      _tabela, 
      columns: [_idMateria, _nome, _quantidade],
      where: "$_idMateria = ?",
      whereArgs: [id]);
      return materias.length > 0 ? MateriasModel.fromMap(materias.first) : null;
  }

  Future<int> updateMateria(MateriasModel materiasModel) async{
    var connection = await _databaseHelper.connection;
    return await connection.update(
      _tabela,
      materiasModel.toMap(),
      where: "$_idMateria = ?",
      whereArgs: [materiasModel.idMaterias]
    );
  }

  Future<List<MateriasModel>> getAllMaterias() async{
    var connection = await _databaseHelper.connection;
    List<Map> maps = await connection.rawQuery("SELECT * FROM $_tabela");
    List<MateriasModel> materias = maps.map((e) => MateriasModel.fromMap(e)).toList();
    return materias;
  }

  Future<int> getNumber() async {
    var connection = await _databaseHelper.connection;
    return Sqflite.firstIntValue(await connection.rawQuery("SELECT COUNT(*) FROM $_tabela"));
  }


}