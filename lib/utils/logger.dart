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
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

/// A global logger
class Log {
  /// Application level logger
  static Logger get app => Logger('app');

  /// Network level logger
  static Logger get net => Logger('net');

  /// Initializes the logging with the specified [level].
  ///
  /// By default the level is set to [Level.FINE] for debug builds and
  /// to [Level.OFF] for release builds.
  ///
  /// The init has to be called once at the app entry point.
  static void init({Level? level}) {
    Logger.root.level = level ?? (kDebugMode ? Level.FINE : Level.OFF);
    Logger.root.onRecord.listen((record) {
      developer.log(record.message,
          level: record.level.value,
          time: record.time,
          name: record.loggerName,
          sequenceNumber: record.sequenceNumber,
          zone: record.zone,
          error: record.error,
          stackTrace: record.stackTrace);
    });
  }
}
