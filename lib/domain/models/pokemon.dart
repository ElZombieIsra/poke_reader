import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ability.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class Pokemon extends Equatable {
  final List<Ability> abilities;

  @JsonKey(name: 'base_experience')
  final double baseExperience;
  final double height;

  @JsonKey(name: 'is_default')
  final bool isDefault;

  @JsonKey(fromJson: _movesFromJson)
  final List<String> moves;
  final String name;

  @JsonKey(fromJson: _typesFromJson)
  final List<String> types;
  final List<Map<String, dynamic>> stats;

  @JsonKey(
    name: 'sprites',
    fromJson: _spriteUrlFromJson,
    toJson: _spriteUrlToJson,
  )
  final String spriteUrl;
  final double weight;

  Pokemon({
    this.abilities,
    this.baseExperience,
    this.height,
    this.isDefault = false,
    this.moves,
    this.name,
    this.spriteUrl,
    this.weight,
    this.types,
    this.stats,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonToJson(this);

  static String _spriteUrlFromJson(json) {
    try {
      return json['front_default'] as String;
    } catch (e) {
      return null;
    }
  }

  static Map<String, dynamic> _spriteUrlToJson(url) {
    return {'front_default': url};
  }

  static List<String> _movesFromJson(json) {
    return (json as List)
        ?.map((move) {
          try {
            return move['move']['name'] as String;
          } catch (e) {
            return null;
          }
        })
        ?.where((e) => e != null)
        ?.toList();
  }

  static List<String> _typesFromJson(json) {
    return (json as List)
        ?.map((move) {
          try {
            return move['type']['name'] as String;
          } catch (e) {
            return null;
          }
        })
        ?.where((e) => e != null)
        ?.toList();
  }

  @override
  List<Object> get props => [
        abilities,
        baseExperience,
        height,
        isDefault,
        moves,
        name,
        spriteUrl,
        weight,
        types,
        stats,
      ];
}
