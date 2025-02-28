import 'package:tabit/domain/entity/character_entity.dart';
import 'package:tabit/domain/entity/characters_page_entity.dart';
import 'package:tabit/domain/repository/characters_repository.dart';
import 'package:tabit/domain/usecase/characters_use_case.dart';

class CharactersUseCaseImpl implements CharactersUseCase {
  final CharactersRepository charactersRepository;

  CharactersUseCaseImpl({
    required this.charactersRepository,
  });

  @override
  Stream<CharactersPageEntity> getInitialCharacters({
    String? name,
    StatusType? statusType,
  }) {
    return charactersRepository.getInitialCharacters(name: name, status: statusType);
  }

  @override
  Stream<CharactersPageEntity> getCharactersInPage({
    required int page,
    String? name,
    StatusType? statusType,
  }) {
    return charactersRepository.getCharactersInPage(page: page, name: name, status: statusType);
  }

  @override
  Stream<CharacterEntity> getCharacterById({
    required int characterId,
  }) {
    return charactersRepository.getCharacterById(characterId: characterId);
  }
}
