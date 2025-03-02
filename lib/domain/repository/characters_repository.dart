import 'package:tabit/domain/entity/character_entity.dart';
import 'package:tabit/domain/entity/characters_page_entity.dart';

/// The class which contains all the required character data methods.
abstract class CharactersRepository {
  /// Fetches the first page of characters.
  Stream<CharactersPageEntity> getInitialCharacters({
    String? name,
    StatusType? status,
  });

  /// Fetches characters from a specific page.
  Stream<CharactersPageEntity> getCharactersInPage({
    required int page,
    String? name,
    StatusType? status,
  });

  /// Fetches a single character by ID.
  Stream<CharacterEntity> getCharacterById({
    required int characterId,
  });
}
