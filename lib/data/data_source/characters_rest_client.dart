import 'package:dio/dio.dart';
import 'package:tabit/data/data_source/characters_datasource.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tabit/data/model/character_model.dart';
import 'package:tabit/data/model/character_page_model.dart';

part 'characters_rest_client.g.dart';

/// Api methods which implement the desired queries of the BE.
@RestApi(baseUrl: 'https://rickandmortyapi.com/api')
abstract class CharactersRestClient implements CharactersDataSource {
  factory CharactersRestClient(Dio dio, {String? baseUrl}) =
      _CharactersRestClient;

  /// Fetches the first page of characters.
  @override
  @GET('/character')
  Stream<CharacterPageModel> getInitialCharacters({
    @Query('name') String? name,
    @Query('status') String? status,
  });

  /// Fetches characters from a specific page.
  @override
  @GET('/character')
  Stream<CharacterPageModel> getCharactersInPage({
    @Query('page') required int page,
    @Query('name') String? name,
    @Query('status') String? status,
  });

  /// Fetches a single character by ID.
  @override
  @GET('/character')
  Stream<CharacterModel> getCharacterById({
    @Path() required int characterId,
  });
}
