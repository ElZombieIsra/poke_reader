// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return Pokemon(
    abilities: (json['abilities'] as List)
        ?.map((e) =>
            e == null ? null : Ability.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    baseExperience: (json['base_experience'] as num)?.toDouble(),
    height: (json['height'] as num)?.toDouble(),
    isDefault: json['is_default'] as bool,
    moves: Pokemon._movesFromJson(json['moves']),
    name: json['name'] as String,
    spriteUrl: Pokemon._spriteUrlFromJson(json['sprites']),
    weight: (json['weight'] as num)?.toDouble(),
    types: Pokemon._typesFromJson(json['types']),
    stats: (json['stats'] as List)
        ?.map((e) => e as Map<String, dynamic>)
        ?.toList(),
  );
}

Map<String, dynamic> _$PokemonToJson(Pokemon instance) => <String, dynamic>{
      'abilities': instance.abilities,
      'base_experience': instance.baseExperience,
      'height': instance.height,
      'is_default': instance.isDefault,
      'moves': instance.moves,
      'name': instance.name,
      'types': instance.types,
      'stats': instance.stats,
      'sprites': Pokemon._spriteUrlToJson(instance.spriteUrl),
      'weight': instance.weight,
    };
