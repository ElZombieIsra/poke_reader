import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_result.g.dart';

@JsonSerializable()
class PokemonResult extends Equatable {
  final String name;
  final String url;

  PokemonResult({
    this.name,
    this.url,
  });

  factory PokemonResult.fromJson(Map<String, dynamic> json) =>
      _$PokemonResultFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonResultToJson(this);

  @override
  List<Object> get props => [
        name,
        url,
      ];
}
