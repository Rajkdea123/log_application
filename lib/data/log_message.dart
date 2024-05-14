import 'package:json_annotation/json_annotation.dart';

part 'log_message.g.dart'; // This line is added to specify the generated file name

@JsonSerializable()
class LogMessage {
  final String level;
  final String logString;
  final String timestamp;
  final String source;

  LogMessage(this.level, this.logString, this.source)
      : timestamp = DateTime.now().toIso8601String();

  factory LogMessage.fromJson(Map<String, dynamic> json) => _$LogMessageFromJson(json);

  Map<String, dynamic> toJson() => _$LogMessageToJson(this);

  @override
  String toString() {
    return 'LogMessage{level: $level, logString: $logString, timestamp: $timestamp, source: $source}';
  }
}