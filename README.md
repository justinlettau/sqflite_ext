[![Pub](https://img.shields.io/pub/v/sqflite_ext.svg)](https://pub.dartlang.org/packages/sqflite_ext)
[![CI](https://github.com/justinlettau/sqflite_ext/workflows/CI/badge.svg)](https://github.com/justinlettau/sqflite_ext/actions)

# sqflite_ext

Useful utilities to augment [sqflite](https://pub.dev/packages/sqflite). Designed to be unobtrusive helpers, so you still access sqflite directly (not a wrapper).

## Usage

### Bool utilities

Sqflite does not support the `bool` type ([reference](https://github.com/tekartik/sqflite/blob/master/sqflite/doc/supported_types.md#supported-sqlite-types)).

```dart
import 'package:sqflite_ext/sqflite_ext.dart';

boolToInt(true);
// => 1

boolToIntOrNull(null);
// => null

intToBool(1);
// => true

intToBoolOrNull(null);
// => null
```

### Named arguments

```dart
import 'package:sqflite_ext/sqflite_ext.dart';

final result = parseNamedArgs(
  'SELECT * FROM demo WHERE id = :id',
  {'id': 83},
);
// result.query => 'SELECT * FROM demo WHERE id = ?'
// result.arguments => [83]
```
