
import 'package:portal_fiap_professor/models/entregas_model.dart';
import 'package:portal_fiap_professor/repository/database_helper.dart';
import 'package:sqflite/sqflite.dart';
 
class EntregaRepository {

  final String _tabela = "entregaModel";
  final String _idEntrega = "id_entrega";
  final String _nome = "nome_trabalho";
  final String _tema  = "tema";
  final String _descricao = "descricao";
  final String _integrantesMax = "integrantes_max";
  final String _integrantesMin  = "integrantes_min";
  final String _dataEntrega  = "data_entrega";
  final String _materiaId  = "materia_id";

  // Instancia do Database Helper
  DatabaseHelper _databaseHelper;
 
  // Construtor
  EntregaRepository() {
    _databaseHelper = new DatabaseHelper();
  }

  Future<EntregasModel> saveEntrega(EntregasModel entregasModel) async{
    var connection = await _databaseHelper.connection;
    entregasModel.codigo = await connection.insert(_tabela, entregasModel.toMap());
    return entregasModel;
  }

  Future<EntregasModel> getEntrega(int id) async{
    var connection = await _databaseHelper.connection;
    List<Map> entregas = await connection.query(
      _tabela, 
      columns: [_idEntrega, _nome, _tema, _descricao,  _integrantesMax, _integrantesMin, _dataEntrega, _materiaId],
      where: "$_idEntrega = ?",
      whereArgs: [id]);
      return entregas.length > 0 ? EntregasModel.fromMap(entregas.first) : null;
  }

  Future<int> updateEntrega(EntregasModel entregasModel) async{
    var connection = await _databaseHelper.connection;
    return await connection.update(
      _tabela,
      entregasModel.toMap(),
      where: "$_idEntrega = ?",
      whereArgs: [entregasModel.codigo]
    );
  }

  Future<List<EntregasModel>> getAllEntregas() async{
    var connection = await _databaseHelper.connection;
    List<Map> maps = await connection.rawQuery("SELECT * FROM $_tabela");
    List<EntregasModel> entregas = maps.map((e) => EntregasModel.fromMap(e)).toList();
    return entregas;
  }

  Future<int> getNumber() async {
    var connection = await _databaseHelper.connection;
    return Sqflite.firstIntValue(await connection.rawQuery("SELECT COUNT(*) FROM $_tabela"));
  }


}