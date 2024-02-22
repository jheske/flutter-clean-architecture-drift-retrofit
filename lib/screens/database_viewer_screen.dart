import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';

import '../core/di/injection_container.dart';
import '../data/local/database/app_database.dart';

class DatabaseViewsScreen extends StatelessWidget {
  final database = serviceLocator.get<AppDatabase>();

  DatabaseViewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Database View'),
      ),
      body: DriftDbViewer(database),
    );
  }
}
