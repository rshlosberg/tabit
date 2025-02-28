import 'package:tabit/domain/entity/character_entity.dart';
import 'package:tabit/domain/entity/characters_page_entity.dart';

abstract class CharactersRepository {
  Stream<CharactersPageEntity> getInitialCharacters({
    String? name,
    StatusType? status,
  });

  Stream<CharactersPageEntity> getCharactersInPage({
    required int page,
    String? name,
    StatusType? status,
  });

  Stream<CharacterEntity> getCharacterById({
    required int characterId,
  });
}
