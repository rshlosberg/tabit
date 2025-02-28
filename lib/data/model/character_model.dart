import 'package:json_annotation/json_annotation.dart';

part 'character_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CharacterModel {
  // The id of the character.
  final int id;
  // The name of the character.
  final String name;
  // The status of the character.
  final String status;
  // The species of the character.
  final String species;
  // The type or subspecies of the character.
  final String type;
  // The gender of the character
  final String gender;
  // Name and link to the character's origin location.
  final CharacterLocationModel origin;
  // Name and link to the character's last known location endpoint.
  final CharacterLocationModel location;
  // Link to the character's image.
  final String image;
  // List of episodes in which this character appeared.
  final List<String> episode;
  // Link to the character's own URL endpoint.
  final String url;
  // Time at which the character was created in the database.
  final DateTime created;

  const CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}

// Name and link to the character's location.
@JsonSerializable(explicitToJson: true)
class CharacterLocationModel {
  // Name of the character's location.
  final String name;
  // Link to the character's location.
  final String url;

  const CharacterLocationModel({
    required this.name,
    required this.url,
  });

  factory CharacterLocationModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterLocationModelToJson(this);
}
