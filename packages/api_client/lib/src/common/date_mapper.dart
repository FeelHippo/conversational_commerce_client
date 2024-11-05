class DateMapper {
  const DateMapper();

  DateTime map(String text) {
    return DateTime.parse(text).toLocal();
  }

  String? reverseMap(DateTime? date) {
    if (date == null) {
      return null;
    }
    return date.toUtc().toIso8601String();
  }
}
