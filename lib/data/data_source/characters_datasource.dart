import 'package:tabit/data/model/character_model.dart';
import 'package:tabit/data/model/character_page_model.dart';

abstract class CharactersDataSource {
  Stream<CharacterPageModel> getInitialCharacters({
    String? name,
    String? status,
  });

  Stream<CharacterPageModel> getCharactersInPage({
    required int page,
    String? name,
    String? status,
  });

  Stream<CharacterModel> getCharacterById({
    required int characterId,
  });
}
