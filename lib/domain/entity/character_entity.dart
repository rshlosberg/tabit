import 'package:equatable/equatable.dart';

/// Status type enum of the character.
enum StatusType {
  alive,
  dead,
  unknown,
}

/// Gender type enum of the character.
enum GenderType {
  genderless,
  female,
  male,
  unknown,
}

/// The class which represent the character's structure in the core of the app.
class CharacterEntity extends Equatable {
  /// The id of the character.
  final int id;
  /// The name of the character.
  final String name;
  /// The status of the character.
  final StatusType status;
  /// The species of the character.
  final String species;
  /// The type or subspecies of the character.
  final String type;
  /// The gender of the character.
  final GenderType gender;
  /// Name and link to the character's origin location.
  final CharacterLocationEntity origin;
  /// Name and link to the character's last known location endpoint.
  final CharacterLocationEntity location;
  /// Link to the character's image.
  final String image;
  /// List of episodes in which this character appeared.
  final List<String> episode;
  /// Link to the character's own URL endpoint.
  final String url;
  /// Time at which the character was created in the database.
  final DateTime created;

  const CharacterEntity({
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

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        type,
        gender,
        origin,
        location,
        image,
        episode,
        url,
        created,
      ];
}

/// Name and link to the character's location.
class CharacterLocationEntity extends Equatable {
  /// Name of the character's location.
  final String name;
  /// Link to the character's location.
  final String url;

  const CharacterLocationEntity({
    required this.name,
    required this.url,
  });

  @override
  List<Object?> get props => [name, url];
}
