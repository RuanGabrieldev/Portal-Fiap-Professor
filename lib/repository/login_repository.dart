import 'package:portal_fiap_professor/models/alunos_model.dart';
import 'package:portal_fiap_professor/models/login_model.dart';
import 'package:portal_fiap_professor/repository/database_helper.dart';
import 'package:sqflite/sqflite.dart';
 
class LoginRepository {

  final String _tabela = "loginsModel";
  final String _login = "login";
  final String _senha = "senha";
  final String _nivelAcesso = "nivel_acesso";


  // Instancia do Database Helper
  DatabaseHelper _databaseHelper;
 
  // Construtor
  LoginRepository() {
    _databaseHelper = new DatabaseHelper();
  }

  Future<LoginModel> saveLogin(LoginModel alunosModel) async{
    var connection = await _databaseHelper.connection;
    alunosModel.login = await connection.insert(_tabela, alunosModel.toMap()).toString();
    return alunosModel;
  }

  Future<LoginModel> getLogin(String id, String pass) async{
    var connection = await _databaseHelper.connection;
    List<Map> logins = await connection.query(_tabela, 
    columns: [_login, _senha, _nivelAcesso],
     where: "$_login = ? and $_senha = ?",
     whereArgs: [id, pass]);
     return logins.length > 0 ? LoginModel.fromMap(logins.first) : null;
  }

  Future<int> updateLogin(LoginModel alunosModel) async{
    var connection = await _databaseHelper.connection;
    return await connection.update(
      _tabela,
      alunosModel.toMap(),
      where: "$_login = ?",
      whereArgs: [alunosModel.login]
    );
  }

  Future<List<LoginModel>> getAllLogin() async{
    var connection = await _databaseHelper.connection;
    List<Map> maps = await connection.rawQuery("SELECT * FROM $_tabela");
    List<LoginModel> alunos = maps.map((e) => LoginModel.fromMap(e)).toList();
    return alunos;
  }

  Future<int> getNumber() async {
    var connection = await _databaseHelper.connection;
    return Sqflite.firstIntValue(await connection.rawQuery("SELECT COUNT(*) FROM $_tabela"));
  }


}