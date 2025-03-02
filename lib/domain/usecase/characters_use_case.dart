import 'package:tabit/domain/entity/character_entity.dart';
import 'package:tabit/domain/entity/characters_page_entity.dart';

/// The UseCase methods.
abstract class CharactersUseCase {
  /// Fetches the first page of characters.
  Stream<CharactersPageEntity> getInitialCharacters({
    String? name,
    StatusType? statusType,
  });

  /// Fetches characters from a specific page.
  Stream<CharactersPageEntity> getCharactersInPage({
    required int page,
    String? name,
    StatusType? statusType,
  });

  /// Fetches a single character by ID.
  Stream<CharacterEntity> getCharacterById({
    required int characterId,
  });
}
