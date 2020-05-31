import 'package:portal_fiap_professor/models/alunos_model.dart';
import 'package:portal_fiap_professor/repository/database_helper.dart';

class AlunoRepository {
  // Instancia do Database Helper
  DatabaseHelper _databaseHelper;

  // Construtor
  AlunoRepository() {
    _databaseHelper = new DatabaseHelper();
  }

  Future<List<AlunosModel>> findAll() async {
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
      "AlunosModel",
      columns: [
        "RM",
        "foto",
        "nome",
        "presenca",
        "turmasModel"
      ],
    );

    // Converte a lista de Maps para Lista de Cursos
    List<AlunosModel> listaAlunos = new List<AlunosModel>();
    for (Map i in result) {
      listaAlunos.add(AlunosModel.fromMap(i));
    }

    return listaAlunos;
  }

  Future<int> create(AlunosModel alunosModel) async {
    var connection = await _databaseHelper.connection;
    var result = await connection.insert(
      "AlunosModel",
      alunosModel.toMap(),
    );
    return result;
  }

  Future<int> createRaw() async {
    var connection = await _databaseHelper.connection;
    var sqlCommand = " INSERT INTO AlunosModel ( " +
        "  foto , " +
        "  nome , " +
        "  turmasModel  ) " +
        "VALUES ( " +
        "    'jpeg' , " +
        "    'Fulano' , " +
        "       1, " +
        "  ) ";

    var result = await connection.rawInsert(sqlCommand);
    return result;
  }

  Future<AlunosModel> get(int idAluno) async {
    var connection = await _databaseHelper.connection;
    List<Map> results = await connection.query(
      "AlunosModel",
      columns: [
        "rm",
        "foto",
        "nome",
        "presenca",
        "turmasModel"
      ],
      where: 'rm = ?',
      whereArgs: [idAluno],
    );

    if (results.length > 0) {
      return AlunosModel.fromMap(
        results.first,
      );
    } else {
      return null;
    }
  }
}
