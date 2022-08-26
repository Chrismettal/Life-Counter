class DataFields {
  static const String id = '_id';
  static const String timestamp = 'timestamp';
  static const String title = 'title';
  static const String value = 'value';
}

class DataRow {
  final int? id; // id for database only
  final String timestamp; // Timestamp of recording
  final String title; // Title in listView
  final int value; // Value for one data point

  const DataRow({
    this.id,
    required this.timestamp,
    required this.title,
    required this.value,
  });
}
