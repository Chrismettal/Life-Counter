const String tableCounterRows = 'rows';

class CounterRowFields {
  static const String id        = '_id';
  static const String title     = 'title';
  static const String position  = 'position';
  static const String type      = 'type';
  static const String reset     = 'reset';
}

class CounterRow {
  final int? id;      // id for database only
  final String title; // Title in listView
  final int position; // Position in listView if reorderable
  final String type;  // Type of counter | Compared with globals.typeTotty etc.
  final String reset; // Reset time to set back to 0 for totties | Compared with globals.resetDaily etc.

  const CounterRow({
    this.id,
    required this.title,
    required this.position,
    required this.type,
    required this.reset,
  });
}
