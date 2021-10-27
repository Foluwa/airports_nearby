import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/port.dart';

class DatabaseService {
  Database _db;

  // ignore: always_declare_return_types
  initDatabase() async {
    _db = await openDatabase('assets/resources.db');
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'resources.db');

    //Check if DB exists
    final exists = await databaseExists(path);

    if (!exists) {
      print('Create a new copy from assets');

      //Check if parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      //Copy from assets
      final data = await rootBundle.load(join('assets', 'resources.db'));
      final List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      //Write and flush the bytes
      await File(path).writeAsBytes(bytes, flush: true);
    }

    //Open the database
    _db = await openDatabase(path, readOnly: true);
  }

  Future<List<PortModel>> getTrails() async {
    await initDatabase();
    final List<Map> list = await _db.rawQuery(
        'SELECT * FROM ports WHERE country is "NG" ORDER BY "_key" ASC LIMIT 100 OFFSET 0');
    // List<Map> list = await _db.rawQuery(
    //     'SELECT * FROM  "ports" ORDER BY "_key" DESC LIMIT 3 OFFSET 0;');
    return list.map((ports) => PortModel.fromJson(ports)).toList();

    // 'SELECT * FROM ports WHERE country is "NG" ORDER BY "_key" ASC LIMIT 100 OFFSET 0');
  }

  // ignore: missing_return
  Future<List<PortModel>> sortbyCountry(String countryCode) async {
    try {
      // ...
      //Handle exception of type SomeException
      print('COUNTRY CODE IS $countryCode');
      await initDatabase();
      final List<Map> list = await _db.rawQuery(
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

  // ignore: always_declare_return_types
  dispose() {
    _db.close();
  }
}
