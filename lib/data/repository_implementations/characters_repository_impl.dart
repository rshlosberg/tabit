import 'package:tabit/data/data_source/characters_datasource.dart';
import 'package:tabit/data/transformer/characters_transformer.dart';
import 'package:tabit/domain/entity/character_entity.dart';
import 'package:tabit/domain/entity/characters_page_entity.dart';
import 'package:tabit/domain/repository/characters_repository.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final CharactersDataSource charactersDataSource;
  final CharactersTransformer transformer;

  CharactersRepositoryImpl({
    required this.charactersDataSource,
    required this.transformer,
  });

  @override
  Stream<CharactersPageEntity> getInitialCharacters({
    String? name,
    StatusType? status,
  }) {
    return charactersDataSource
        .getInitialCharacters(name: name, status: status?.name)
        .map((event) {
          return transformer.transformCharacterPageModel(characterPageModel: event);
        });
  }

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

  @override
  Stream<CharacterEntity> getCharacterById({
    required int characterId,
  }) {
    return charactersDataSource.getCharacterById(characterId: characterId).map(
        (event) => transformer.transformCharacterModel(characterModel: event));
  }

// @override
// Stream<ArticlesEntity> getEverything({
//   String? q,
//   List<SearchInType>? searchIn = SearchInType.values,
//   List<String>? sources,
//   List<String>? domains,
//   List<String>? excludeDomains,
//   DateTime? from,
//   DateTime? to,
//   LanguageType? language,
//   SortByType? sortBy = SortByType.publishedAt,
//   int? pageSize = 100,
//   int? page = 1,
// }) {
//   return charactersDataSource
//       .getEverything(
//         q: q,
//         searchIn: searchIn?.map((e) => e.name).join(','),
//         sources: sources?.take(20).join(','),
//         domains: domains?.join(', '),
//         excludeDomains: excludeDomains?.join(', '),
//         from: from?.toIso8601String(),
//         to: to?.toIso8601String(),
//         language: language?.name,
//         sortBy: sortBy?.name,
//         pageSize: pageSize != null ? max(pageSize, 100).toString() : null,
//         page: page?.toString(),
//       )
//       .map(
//           (event) => transformer.transformArticlesModel(articlesModel: event))
//       .onErrorReturnWith(
//         (error, stackTrace) =>
//             _onErrorReturnWith(error: error, stackTrace: stackTrace),
//       );
// }
//
// @override
// Stream<ArticlesEntity> getTopHeadlines({
//   CountryType? country,
//   CategoryType? category,
//   List<String>? sources,
//   String? q,
//   int? pageSize = 20,
//   int? page,
// }) {
//   return charactersDataSource
//       .getTopHeadlines(
//         country: country?.name,
//         category: category?.name,
//         sources: sources?.join(','),
//         q: q,
//         pageSize: pageSize != null ? max(pageSize, 100).toString() : null,
//         page: page?.toString(),
//       )
//       .map(
//         (event) => transformer.transformArticlesModel(articlesModel: event),
//       )
//       .onErrorReturnWith(
//         (error, stackTrace) =>
//             _onErrorReturnWith(error: error, stackTrace: stackTrace),
//       );
// }
//
// ArticlesErrorEntity _onErrorReturnWith({
//   required Object error,
//   required StackTrace stackTrace,
// }) {
//   return error is DioException
//       ? ArticlesErrorEntity(
//           code: error.response?.statusCode?.toString() ?? '',
//           message: error.response?.statusMessage ?? '')
//       : ArticlesErrorEntity(
//           code: error.toString(),
//           message: stackTrace.toString(),
//         );
// }
}
