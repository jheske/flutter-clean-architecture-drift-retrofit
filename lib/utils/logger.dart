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
