import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_ext/src/parse_named_args.dart';

void main() {
  group('parseNamedArgs', () {
    test('with no params', () {
      final result = parseNamedArgs(
        'SELECT * FROM demo',
        {},
      );

      expect(result.query, 'SELECT * FROM demo');
      expect(result.arguments, []);
    });

    test('with missing param', () {
      final result = parseNamedArgs(
        'SELECT * FROM demo WHERE id = :fail',
        {},
      );

      expect(result.query, 'SELECT * FROM demo WHERE id = ?');
      expect(result.arguments, [null]);
    });

    test('with a single param', () {
      final result = parseNamedArgs(
        'SELECT * FROM demo WHERE id = :id',
        {'id': 83},
      );

      expect(result.query, 'SELECT * FROM demo WHERE id = ?');
      expect(result.arguments, [83]);
    });

    test('with multiple different params', () {
      final result = parseNamedArgs(
        'SELECT * FROM demo WHERE a = :a AND b = :b AND c = :c',
        {'a': 83, 'b': 'active', 'c': true},
      );

      expect(
        result.query,
        'SELECT * FROM demo WHERE a = ? AND b = ? AND c = ?',
      );
      expect(result.arguments, [83, 'active', true]);
    });

    test('with the same param multiple times', () {
      final result = parseNamedArgs(
        'SELECT * FROM demo WHERE a = :a AND b = :b AND c = :b',
        {'a': 83, 'b': 'active'},
      );

      expect(
        result.query,
        'SELECT * FROM demo WHERE a = ? AND b = ? AND c = ?',
      );
      expect(result.arguments, [83, 'active', 'active']);
    });
  });
}
