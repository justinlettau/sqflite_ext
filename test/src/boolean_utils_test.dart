import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_ext/sqflite_ext.dart';

void main() {
  group('boolToInt', () {
    test('returns int directly', () {
      expect(boolToInt(0), 0);
    });

    test('returns 1 when true', () {
      expect(boolToInt(true), 1);
    });

    test('returns 0 when false', () {
      expect(boolToInt(false), 0);
    });
  });

  group('boolToIntOrNull', () {
    test('returns null when null', () {
      expect(boolToIntOrNull(null), null);
    });
  });

  group('intToBool', () {
    test('returns boolean directly', () {
      expect(intToBool(false), false);
    });

    test('returns true when 1', () {
      expect(intToBool(1), true);
    });

    test('returns false when 0', () {
      expect(intToBool(0), false);
    });

    test('returns false when not 1 or 0', () {
      expect(intToBool(-1), false);
      expect(intToBool(2), false);
    });
  });

  group('intToBoolOrNull', () {
    test('returns null when null', () {
      expect(boolToIntOrNull(null), null);
    });
  });

  group('sqflite integration', () {
    late Database db;

    setUpAll(() async {
      sqfliteFfiInit();

      final factory = databaseFactoryFfi;
      db = await factory.openDatabase(inMemoryDatabasePath);

      await db.execute('''
        CREATE TABLE demo (
          id INTEGER PRIMARY KEY,
          isAwesome INTEGER NOT NULL
        )
      ''');
    });

    // https://github.com/tekartik/sqflite/blob/master/sqflite/doc/supported_types.md#supported-sqlite-types
    test('sqflite does not support bool', () async {
      expect(
        () async => await db.insert('demo', {'isAwesome': true}),
        throwsException,
      );
    });

    test('converting bool to int succeeds', () async {
      final id = await db.insert('demo', {'isAwesome': boolToInt(true)});
      final result = await db.query(
        'demo',
        where: 'id = ?',
        whereArgs: [id],
      );

      expect(result.first['isAwesome'], 1);
    });
  });
}
