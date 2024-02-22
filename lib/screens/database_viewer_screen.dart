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
