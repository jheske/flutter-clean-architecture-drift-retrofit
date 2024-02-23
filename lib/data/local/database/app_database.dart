/// Copyright (C) 2024 Jill Heske
/// This file is part of flutter-clean-architecture-drift-retrofit.
///
/// flutter-clean-architecture-drift-retrofit is free software: you can redistribute it and/or modify
/// it under the terms of the Apache License, Version 2.0, as published by
/// the Apache Software Foundation.
///
/// flutter-clean-architecture-drift-retrofit is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
/// Apache License, Version 2.0 for more details.
///
/// You should have received a copy of the Apache License, Version 2.0
/// along with flutter-clean-architecture-drift-retrofit. If not, see <https:///www.apache.org/licenses/LICENSE-2.0>.
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';

// This file contains the definition of the AppDatabase class, which represents
// the main database for the application. It is annotated with @DriftDatabase,
// indicating that it's a Drift database and includes the tables defined in
// 'tables.drift'.
part '.generated/app_database.g.dart'; // Include the generated part file.

@DriftDatabase(include: {'tables.drift'})
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection()); // Constructor for AppDatabase.

  @override
  int get schemaVersion => 1; // Get the schema version of the database.
}

// Function to open the database connection.
LazyDatabase _openConnection() {
  // The LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // Put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file); // Create the database in the background.
  });
}
