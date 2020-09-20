// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ability _$AbilityFromJson(Map<String, dynamic> json) {
  return Ability(
    name: Ability._nameFromJson(json['ability']),
    isHidden: json['is_hidden'] as bool,
    slot: json['slot'] as int,
  );
}

Map<String, dynamic> _$AbilityToJson(Ability instance) => <String, dynamic>{
      'ability': instance.name,
      'is_hidden': instance.isHidden,
      'slot': instance.slot,
    };
