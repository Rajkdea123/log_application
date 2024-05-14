// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogMessage _$LogMessageFromJson(Map<String, dynamic> json) => LogMessage(
      json['level'] as String,
      json['logString'] as String,
      json['source'] as String,
    );

Map<String, dynamic> _$LogMessageToJson(LogMessage instance) =>
    <String, dynamic>{
      'level': instance.level,
      'logString': instance.logString,
      'source': instance.source,
    };
