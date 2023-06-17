[![Pub](https://img.shields.io/pub/v/sqflite_ext.svg)](https://pub.dartlang.org/packages/sqflite_ext)
[![CI](https://github.com/justinlettau/sqflite_ext/workflows/CI/badge.svg)](https://github.com/justinlettau/sqflite_ext/actions)

# sqflite_ext

Useful utilities to augment [sqflite](https://pub.dev/packages/sqflite). Designed to be unobtrusive helpers, so still access sqflite directly (not a wrapper).

## Features

- Functions for working with `bool` values ([sqflite does not support bool](https://github.com/tekartik/sqflite/blob/master/sqflite/doc/supported_types.md#supported-sqlite-types))

## Usage

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
