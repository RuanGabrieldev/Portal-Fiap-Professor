import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {

  // Instancia do SQFLite Database
  static Database _database;

  // Instancia da classe Helper
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  // Fábrica de construtor
  factory DatabaseHelper() {
    return _instance;
  }

  // Construtor nomeado 
  DatabaseHelper._internal();

  // Abre conexão com o banco
  Future<Database> get connection async {
    if (_database == null) {
      _database = await _createDatabase();
    }
    return _database;
  }

  Future<Database> _createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'nacflutter.db');

    var database = await openDatabase(
      dbPath,
      version: 5,
      onCreate: _createTables,
    );

    return database;
  }

  void _createTables(Database database, int version) async {
    // Criando a tabela de Cursos
   

    await database.execute(
      '''
      CREATE TABLE turmasModel (
        id_turma INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        tipo_curso TEXT,
        nome_turma TEXT,
        ano_curso TEXT,
        turno_curso TEXT,
        professor_id INTEGER,
        FOREIGN KEY(professor_id) REFERENCES professoresModel(id_professor)
      )
      ''',
    );

    


     await database.execute(
      '''
      CREATE TABLE alunosModel (
        id_aluno INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        foto TEXT,
        nome TEXT,
        turma_id INTEGER,
        login_id TEXT,
        FOREIGN KEY(turma_id) REFERENCES turmasModel(id_turma),
        FOREIGN KEY(login_id) REFERENCES turmasModel(id_login)
      )
      ''',
    );

    await database.execute(
      '''
      CREATE TABLE presencasModel (
        id_presenca INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nome_aula TEXT,
        data_aula TEXT,
        presente INTEGER,
        comentarios TEXT,
        aluno INTEGER,
        FOREIGN KEY(aluno) REFERENCES alunosModel(id_aluno)
      )
      ''',
    );
    await database.execute(
      '''
      CREATE TABLE materiasModel (
        id_materia INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nome_materia TEXT,
        quantidade_aula INTEGER,
        professor_id INTEGER,
        turma_id INTEGER,
        FOREIGN KEY(professor_id) REFERENCES professoresModel(id),
        FOREIGN KEY(turma_id) REFERENCES turmasModel(id_turma)
      )
      ''',
    );

    await database.execute(
      '''
      CREATE TABLE loginsModel (
        login TEXT PRIMARY KEY NOT NULL,
        senha TEXT,
        nivel_acesso INTEGER
      )
      ''',
    );

    await database.execute(
      '''
      CREATE TABLE professoresModel (
        id_professor INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nome_professor TEXT,
        foto TEXT,
        login_id TEXT,
        FOREIGN KEY(login_id) REFERENCES loginsModel(id_login)
      )
      ''',
    );

    await database.execute(
      '''
      CREATE TABLE entregasModel (
        id_entrega INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nome_trabalho TEXT,
        tema TEXT,
        descricao TEXT,
        integrantes_max INTEGER,
        integrantes_min INTEGER,
        data_entrega TEXT,
        materia_id TEXT,
        FOREIGN KEY(materia_id) REFERENCES materiasModel(id_materia)
      )
      ''',
    );



////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////


      await database.execute(
        '''
        INSERT INTO loginsModel (
          login,
          senha,
          nivel_acesso
        ) VALUES(
          "pf2020",
          "123456",
          2
        )
        ''',
      );

      await database.execute(
        '''
        INSERT INTO loginsModel (
          login,
          senha,
          nivel_acesso
        ) VALUES(
          "rm81679",
          "123456",
          1
        )
        ''',
      );
 
    await database.execute(
      '''
      INSERT INTO professoresModel (
        id_professor,
        nome_professor,
        foto,
        login_id
      ) VALUES(
          1,
          "Flávio Moreni",
          "flavio.png",
          "pf2020"
      )

      ''',
    );

     await database.execute(
      '''
      INSERT INTO turmasModel (
        id_turma,
        tipo_curso,
        nome_turma,
        ano_curso,
        turno_curso,
        professor_id
        ) VALUES(
          1,
          "Sistemas de Informação",
          "SI-B",
          "Terceiro Ano - Quinto Semestre",
          "Noturno",
          1
        )
      ''',
    );

     await database.execute(
      '''
      INSERT INTO turmasModel (
        id_turma,
        tipo_curso,
        nome_turma,
        ano_curso,
        turno_curso,
        professor_id
        ) VALUES(
          2,
          "Sistemas de Informação",
          "SI-S",
          "Terceiro Ano - Quinto Semestre",
          "Noturno",
          1
        )
      ''',
    );
     await database.execute(
      '''
      INSERT INTO turmasModel (
        id_turma,
        tipo_curso,
        nome_turma,
        ano_curso,
        turno_curso,
        professor_id
        ) VALUES(
          3,
          "Sistemas de Informação",
          "SI-R",
          "Terceiro Ano - Quinto Semestre",
          "Noturno",
          1
        )
      ''',
    );
     await database.execute(
      '''
      INSERT INTO turmasModel (
        id_turma,
        tipo_curso,
        nome_turma,
        ano_curso,
        turno_curso,
        professor_id
        ) VALUES(
          4,
          "Sistemas de Informação",
          "SI-A",
          "Primeiro ano - Segundo Semestre",
          "Diurno",
          1
        )
      ''',
    );

      await database.execute(
      '''
      INSERT INTO turmasModel (
        id_turma,
        tipo_curso,
        nome_turma,
        ano_curso,
        turno_curso,
        professor_id
        ) VALUES(
          5,
          "Jogos Digitais",
          "JG-A",
          "Segundo ano- Quarto Semestre",
          "Diurno",
          1
        )
      ''',
    );


  await database.execute(
      '''
      INSERT INTO turmasModel (
        id_turma,
        tipo_curso,
        nome_turma,
        ano_curso,
        turno_curso,
        professor_id
        ) VALUES(
          6,
          "Engenharia da Computação",
          "EC-S",
          "Terceiro Ano - Quinto Semestre",
          "Noturno",
          1
        )
      ''',
    );

    
    

    await database.execute(
      '''
      INSERT INTO alunosModel (
        id_aluno,
        foto,
        nome ,
        turma_id,
        login_id) VALUES(
          81679,
          "ruan.png",
          "Ruan Gabriel",
          1,
          "rm81679"
        )
       
      ''',
    );

     await database.execute(
      '''
      INSERT INTO materiasModel (
        id_materia,
        nome_materia,
        quantidade_aula,
        professor_id,
        turma_id) VALUES(
          1,
          "DESENVOLVIMENTO CROSS PLATFORM",
          48,
          1,
          1
        ) 
      ''',
    );




    await database.execute(
      '''
      INSERT INTO entregasModel (
        id_entrega,
        nome_trabalho,
        tema,
        descricao,
        integrantes_max,
        integrantes_min,
        data_entrega,
        materia_id
      ) 
      VALUES(
      1,
      "Desenvolvimento da interface de gerenciamento da FIAP",
      "Flutter + SQFlite",
      "Nac 2 para a matéria de desenvolvimento Cross Platform",
      5,
      1,
      "31/05/2020",
      1
      )
      ''',
    );


   

  }
}
