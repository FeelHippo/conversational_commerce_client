import 'package:json_annotation/json_annotation.dart';

import '../common/date_mapper.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  DateMapper get _dateMapper => const DateMapper();

  @override
  String toJson(DateTime object) {
    return _dateMapper.reverseMap(object)!;
  }

  @override
  DateTime fromJson(String json) {
    return _dateMapper.map(json);
  }
}

class DateTimeConverterNullable implements JsonConverter<DateTime?, String?> {
  const DateTimeConverterNullable();

  DateMapper get _dateMapper => const DateMapper();

  @override
  String? toJson(DateTime? object) {
    return _dateMapper.reverseMap(object);
  }

  @override
  DateTime? fromJson(String? json) {
    if (json == null || json.isEmpty) {
      return null;
    }
    return _dateMapper.map(json);
  }
}
