import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ability.g.dart';

@JsonSerializable()
class Ability extends Equatable {
  @JsonKey(name: 'ability', fromJson: _nameFromJson)
  final String name;
  @JsonKey(name: 'is_hidden')
  final bool isHidden;
  final int slot;

  Ability({
    this.name,
    this.isHidden,
    this.slot,
  });

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);
  Map<String, dynamic> toJson() => _$AbilityToJson(this);

  static String _nameFromJson(json) {
    try {
      return json['name'] as String;
    } catch (e) {
      return null;
    }
  }

  @override
  List<Object> get props => [
        name,
        isHidden,
        slot,
      ];
}
