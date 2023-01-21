import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:flutter_pi_app/models/pi-config.model.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  // fields
  static const _dbName = 'cfg_pi_admin_database.db';
  static const _dbVersion = 1;

  static const table = 'PiConfig';
  static const tableColumnId = 'id';
  static const tableColumnIpaddress = 'ipaddress';
  static const tableColumnIpaddressPort = 'port';
  // end fields

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _setupConnection();
    return _database;
  }

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $table($tableColumnId INTEGER PRIMARY KEY, $tableColumnIpaddress TEXT, $tableColumnIpaddressPort INTEGER)');

    var model = PiConfig(
        id: '0', ipaddress: '192.168.178.24', port: '', machineName: '');
    await db.insert(
      table,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    model = PiConfig(
        id: '1', ipaddress: '192.168.178.25', port: '', machineName: '');
    await db.insert(
      table,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    model = PiConfig(
        id: '2', ipaddress: '192.168.178.26', port: '', machineName: '');
    await db.insert(
      table,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Database> _setupConnection() async {
    // Avoid errors caused by flutter upgrade.
    // Importing 'package:flutter/widgets.dart' is required.
    //WidgetsFlutterBinding.ensureInitialized();
    // Open the database and store the reference.
    // return await openDatabase(
    //     // Set the path to the database. Note: Using the `join` function from the
    //     // `path` package is best practice to ensure the path is correctly
    //     // constructed for each platform.
    //     join(await getDatabasesPath(), _dbName),
    //     version: _dbVersion,
    //     onCreate: _onCreate);

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _dbName);
    // return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);

    var databaseFactory = databaseFactoryFfi;
    var dbOptions =
        OpenDatabaseOptions(version: _dbVersion, onCreate: _onCreate);
    return await databaseFactory.openDatabase(path, options: dbOptions);
  }
}
