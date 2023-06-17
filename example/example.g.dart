// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DemoItem _$DemoItemFromJson(Map<String, dynamic> json) => DemoItem(
      id: json['id'] as int?,
      isAwesome: intToBool(json['isAwesome'] as int),
    );

Map<String, dynamic> _$DemoItemToJson(DemoItem instance) => <String, dynamic>{
      'id': instance.id,
      'isAwesome': boolToInt(instance.isAwesome),
    };
