import 'dart:async';
import 'package:flutter_pi_app/models/pi-config.model.dart';
import 'package:flutter_pi_app/services/storage-database-helper.dart';
import 'package:sqflite/sqflite.dart';

import 'package:flutter_pi_app/services/storage-database.service.dart';

class StorageDatabasePiConfgService extends StorageService {
  @override
  Future<void> create(PiConfig model) async {
    Database? db = await DatabaseHelper.instance.database;
    if (db != null) {
      await db.insert(
        'PiConfig',
        model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  @override
  Future<List<PiConfig>> getConfigs() async {
    Database? db = await DatabaseHelper.instance.database;
    List<String> columnsToSelect = [
      DatabaseHelper.tableColumnId,
      DatabaseHelper.tableColumnIpaddress,
      DatabaseHelper.tableColumnIpaddressPort
    ];

    if (db != null) {
      List<Map> maps =
          await db.query(DatabaseHelper.table, columns: columnsToSelect);

      return List.generate(maps.length, (i) {
        return PiConfig(
            id: maps[i]['id'],
            ipaddress: maps[i]['ipaddress'],
            port: maps[i]['port'],
            machineName: '');
      });
    }
    return [];
  }
}
