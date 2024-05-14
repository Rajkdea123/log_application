import 'dart:convert';
import 'dart:io';

import 'package:log_application/data/log_message.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class LogService {
  static final Logger _logger = Logger(level: Level.debug);
  static final Map<String, String> _config = {}; // Config for source -> file mapping

  static Future<void> initialize(Map<String, String> config) async {
    _config.addAll(config);
  }

  static Future<void> ingest(String level, String logString, String source) async {
    try {
      final message = LogMessage(level, logString, source);
      final file = await _getLogFile(source);
      await file.writeAsString(jsonEncode(message) + '\n', mode: FileMode.append);
    } catch (e) {
      _logger.i('Error writing log: $e');
    }
  }

  static Future<File> _getLogFile(String source) async {
    final appDir = await getApplicationDocumentsDirectory();
    final filePath = '${appDir.path}/${_config[source]}';
    return File(filePath);
  }

  static Future<List<LogMessage>> searchLogs(String searchTerm) async {
    final results = <LogMessage>[];
    for (final source in _config.keys) {
      final file = await _getLogFile(source);
      if (await file.exists()) {
        final lines = await file.readAsLines();
        for (final line in lines) {
          final message = LogMessage.fromJson(jsonDecode(line));
          if (message.logString.toLowerCase().contains(searchTerm.toLowerCase())) {
            results.add(message);
          }
        }
      }
    }
    return results;
  }
}
