/// Copyright (C) 2024 Jill Heske
///
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

import 'package:drift_db_viewer/drift_db_viewer.dart'; // Package for viewing Drift databases.
import 'package:flutter/material.dart'; // Flutter material library.

import '../core/di/injection_container.dart'; // Import dependency injection container.
import '../data/local/database/app_database.dart'; // Import AppDatabase class.

// This class represents the DatabaseViewsScreen, which is a StatelessWidget used to
// display a view of the application database using DriftDbViewer.

class DatabaseViewsScreen extends StatelessWidget {
  // Database instance obtained from the service locator.
  final database = serviceLocator.get<AppDatabase>();

  // Constructor for DatabaseViewsScreen.
  DatabaseViewsScreen({super.key});

  // Build method to construct the UI for DatabaseViewsScreen.
  @override
  Widget build(BuildContext context) {
    // Return Scaffold widget with AppBar and body content.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database View'), // Set app bar title.
      ),
      body: DriftDbViewer(database), // Display DriftDbViewer widget with the database.
    );
  }
}
