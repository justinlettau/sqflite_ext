import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_ext/sqflite_ext.dart';

part 'example.g.dart';

void main() async {
  final path = await getDatabasesPath();
  final db = await openDatabase(
    join(path, 'example.db'),
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE demo (
          id INTEGER PRIMARY KEY,
          isAwesome INTEGER NOT NULL
        )
      ''');
    },
  );

  // simple inline use of utility function
  await db.insert('demo', {'isAwesome': boolToInt(false)});

  // use with json_annotation (see class DemoItem below)
  const item = DemoItem(isAwesome: true);
  await db.insert('demo', item.toJson());

  // query with named args
  final p = parseNamedArgs(
    'SELECT * FROM demo WHERE isAwesome = :status',
    {'status': true},
  );
  await db.query(p.query, whereArgs: p.arguments);
}

@immutable
@JsonSerializable()
class DemoItem {
  const DemoItem({
    this.id,
    required this.isAwesome,
  });

  final int? id;

  @JsonKey(fromJson: intToBool, toJson: boolToInt)
  final bool isAwesome;

  factory DemoItem.fromJson(Map<String, dynamic> json) =>
      _$DemoItemFromJson(json);

  Map<String, dynamic> toJson() => _$DemoItemToJson(this);
}
