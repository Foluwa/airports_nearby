import 'dart:io';

import 'package:flutter/services.dart';
import 'package:nearby/models/Port.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Database _db;

  initDatabase() async {
    _db = await openDatabase('assets/resources.db');
    var databasePath = await getDatabasesPath();
    var path = join(databasePath, 'resources.db');

    //Check if DB exists
    var exists = await databaseExists(path);

    if (!exists) {
      print('Create a new copy from assets');

      //Check if parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      //Copy from assets
      ByteData data = await rootBundle.load(join("assets", "resources.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      //Write and flush the bytes
      await File(path).writeAsBytes(bytes, flush: true);
    }

    //Open the database
    _db = await openDatabase(path, readOnly: true);
  }

  Future<List<PortModel>> getTrails() async {
    await initDatabase();
    List<Map> list = await _db
        .rawQuery('SELECT * FROM ports ORDER BY "_key" ASC LIMIT 100 OFFSET 0');
    // List<Map> list = await _db.rawQuery(
    //     'SELECT * FROM  "ports" ORDER BY "_key" DESC LIMIT 3 OFFSET 0;');
    return list.map((ports) => PortModel.fromJson(ports)).toList();

    // 'SELECT * FROM ports WHERE country is "NG" ORDER BY "_key" ASC LIMIT 100 OFFSET 0');
  }

  Future<List<PortModel>> sortbyCountry(String countryCode) async {
    try {
      // ...
      //Handle exception of type SomeException
      print('COUNTRY CODE IS $countryCode');
      await initDatabase();
      List<Map> list = await _db.rawQuery(
          'SELECT * FROM ports WHERE country is "${countryCode.toUpperCase()}" ORDER BY "_key" ASC LIMIT 100 OFFSET 0');
      // List<Map> list = await _db.rawQuery(
      //     'SELECT * FROM  "ports" ORDER BY "_key" DESC LIMIT 3 OFFSET 0;');
      return list.map((ports) => PortModel.fromJson(ports)).toList();

      // 'SELECT * FROM ports WHERE country is "NG" ORDER BY "_key" ASC LIMIT 100 OFFSET 0');
    }
    // on SomeException catch(e) {
    //
    // }
    catch (e) {
      print('ERROR $e');
    }
    //Handle all other exceptions
  }

  dispose() {
    _db.close();
  }
}
