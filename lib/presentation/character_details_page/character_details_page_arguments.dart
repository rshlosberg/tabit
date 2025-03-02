import 'package:tabit/domain/entity/character_entity.dart';

/// The required arguments to pass to the [CharacterDetailsPage].
class CharacterDetailsPageArguments {
  final CharacterEntity characterEntity;

  const CharacterDetailsPageArguments({
    required this.characterEntity,
  });
}
