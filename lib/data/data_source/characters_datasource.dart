import 'package:tabit/data/model/character_model.dart';
import 'package:tabit/data/model/character_page_model.dart';

/// All the desired queries of the BE.
abstract class CharactersDataSource {
  /// Fetches the first page of characters.
  Stream<CharacterPageModel> getInitialCharacters({
    String? name,
    String? status,
  });

  /// Fetches characters from a specific page.
  Stream<CharacterPageModel> getCharactersInPage({
    required int page,
    String? name,
    String? status,
  });

  /// Fetches a single character by ID.
  Stream<CharacterModel> getCharacterById({
    required int characterId,
  });
}
