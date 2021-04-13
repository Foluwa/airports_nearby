import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class dbSql {
  Future<Database> database;
  init() async {
    // Avoid errors caused by flutter upgrade.
    // Importing 'package:flutter/widgets.dart' is required.
    WidgetsFlutterBinding.ensureInitialized();
    // Open the database and store the reference.
    database = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'assets/data/resources.db'),
      // When the database is first created, create a table to store dogs.
      //bookingId STRING PRIMARY KEY, waitingTime INTEGER, driveTime INTEGER, distance DOUBLE, operationId STRING, clientId STRING, minPrice INTEGER, maxPrice INTEGER, paymentPref STRING
      // onCreate: (db, version) {
      //   return db.execute(
      //     "CREATE TABLE bookings(id STRING PRIMARY KEY, pickup_location STRING, transportation_id STRING, destination STRING, distance STRING, pickup_location_gps STRING, destination_gps STRING, user_id STRING, amount STRING, paymentPreference STRING, pickup_date STRING, created_at DATETIME )",
      //   );
      // },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }
}
