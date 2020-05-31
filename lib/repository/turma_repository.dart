import 'package:portal_fiap_professor/models/turmas_model.dart';
import 'package:portal_fiap_professor/repository/database_helper.dart';

class TurmaRepository {
  // Instancia do Database Helper
  DatabaseHelper _databaseHelper;

  // Construtor
  TurmaRepository() {
    _databaseHelper = new DatabaseHelper();
  }

  Future<List<TurmasModel>> findAll() async {
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
      "TurmasModel",
      columns: [
        "idTurma",
        "tipoCurso",
        "anoCurso",
        "quantidaDeAlunos",
      ],
    );

    // Converte a lista de Maps para Lista de Cursos
    List<TurmasModel> listaTurmas = new List<TurmasModel>();
    for (Map i in result) {
      listaTurmas.add(TurmasModel.fromMap(i));
    }

    return listaTurmas;
  }

  Future<int> create(TurmasModel turmasModel) async {
    var connection = await _databaseHelper.connection;
    var result = await connection.insert(
      "TurmasModel",
      turmasModel.toMap(),
    );
    return result;
  }

  Future<int> createRaw() async {
    var connection = await _databaseHelper.connection;
    var sqlCommand = " INSERT INTO TurmasModel ( " +
        "  tipoCurso , " +
        "  anoCurso , " +
        "  quantidaDeAlunos  ) " +
        "VALUES ( " +
        "    'SI' , " +
        "     '1' , " +
        "     50  , " +
        "  ) ";

    var result = await connection.rawInsert(sqlCommand);
    return result;
  }

  Future<TurmasModel> get(int idTurma) async {
    var connection = await _databaseHelper.connection;
    List<Map> results = await connection.query(
      "TurmasModel",
      columns: [
        "idTurma",
        "tipoCurso",
        "anoCurso",
        "quantidaDeAlunos"
      ],
      where: 'idTurma = ?',
      whereArgs: [idTurma],
    );

    if (results.length > 0) {
      return TurmasModel.fromMap(
        results.first,
      );
    } else {
      return null;
    }
  }

  // Future<TurmasModel> getRaw(int id) async {
  //   var connection = await _databaseHelper.connection;
  //   var sqlCommand = "SELECT * FROM TurmasModel WHERE ID = $id  ";

  //   var results = await connection.rawQuery(sqlCommand);
  //   if (results.length > 0) {
  //     return new TurmasModel.fromMap(results.first);
  //   } else {
  //     return null;
  //   }
  // }

  // Future<int> update(TurmasModel TurmasModel) async {
  //   var connection = await _databaseHelper.connection;
  //   return await connection.update(
  //     "TurmasModel",
  //     TurmasModel.toMap(),
  //     where: "id = ?",
  //     whereArgs: [TurmasModel.id],
  //   );
  // }

  // Future<int> updateRaw(TurmasModel TurmasModel) async {
  //   var connection = await _databaseHelper.connection;
  //   var sqlCommand = " UPDATE TurmasModel SET  " +
  //       "  nome = '${TurmasModel.nome}' , " +
  //       "  nivel = '${TurmasModel.nivel}' , " +
  //       "  percentualConclusao = ${TurmasModel.percentualConclusao} , " +
  //       "  preco = ${TurmasModel.preco} , " +
  //       "  conteudo =  '${TurmasModel.conteudo}'  " +
  //       " WHERE id = ${TurmasModel.id} ";

  //   var result = await connection.rawUpdate(sqlCommand);
  //   return result;
  // }

  // Future<void> delete(TurmasModel TurmasModel) async {
  //   var connection = await _databaseHelper.connection;
  //   return await connection.delete(
  //     "TurmasModel",
  //     where: "id = ?",
  //     whereArgs: [TurmasModel.id],
  //   );
  // }

  // Future<void> deleteRaw(TurmasModel TurmasModel) async {
  //   var connection = await _databaseHelper.connection;
  //   var sqlCommand =
  //       " DELETE FROM TurmasModel   " + " WHERE id = ${TurmasModel.id} ";

  //   var result = await connection.rawDelete(sqlCommand);
  //   return result;
  // }
}
