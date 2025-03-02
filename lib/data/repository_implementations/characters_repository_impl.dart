import 'package:tabit/data/data_source/characters_datasource.dart';
import 'package:tabit/data/transformer/characters_transformer.dart';
import 'package:tabit/domain/entity/character_entity.dart';
import 'package:tabit/domain/entity/characters_page_entity.dart';
import 'package:tabit/domain/repository/characters_repository.dart';

/// The main class to get all the required character data.
/// Right now it communicate with remote queries (APIs),
/// but it can also contain local queries (DB, for example).
class CharactersRepositoryImpl implements CharactersRepository {
  final CharactersDataSource charactersDataSource;
  final CharactersTransformer transformer;

  CharactersRepositoryImpl({
    required this.charactersDataSource,
    required this.transformer,
  });

  /// Fetches the first page of characters.
  @override
  Stream<CharactersPageEntity> getInitialCharacters({
    String? name,
    StatusType? status,
  }) {
    return charactersDataSource
        .getInitialCharacters(name: name, status: status?.name)
        .map((event) =>
            transformer.transformCharacterPageModel(characterPageModel: event));
  }

  /// Fetches characters from a specific page.
  @override
  Stream<CharactersPageEntity> getCharactersInPage({
    required int page,
    String? name,
    StatusType? status,
  }) {
    return charactersDataSource
        .getCharactersInPage(page: page, name: name, status: status?.name)
        .map((event) =>
            transformer.transformCharacterPageModel(characterPageModel: event));
  }

  /// Fetches a single character by ID.
  @override
  Stream<CharacterEntity> getCharacterById({
    required int characterId,
  }) {
    return charactersDataSource.getCharacterById(characterId: characterId).map(
        (event) => transformer.transformCharacterModel(characterModel: event));
  }
}
