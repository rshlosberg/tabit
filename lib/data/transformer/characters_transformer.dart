import 'package:enum_to_string/enum_to_string.dart';
import 'package:tabit/data/model/character_model.dart';
import 'package:tabit/data/model/character_page_model.dart';
import 'package:tabit/data/model/container_response_model.dart';
import 'package:tabit/domain/entity/character_entity.dart';
import 'package:tabit/domain/entity/characters_page_entity.dart';

/// The main transformer between characters models to characters entities.
class CharactersTransformer {

  /// Transform [CharacterPageModel] to [CharactersPageEntity].
  CharactersPageEntity transformCharacterPageModel({
    required CharacterPageModel characterPageModel,
  }) {
    return CharactersPageEntity(
      info: _transformInfoModel(infoModel: characterPageModel.info),
      results: characterPageModel.results
          .map((characterModel) =>
              transformCharacterModel(characterModel: characterModel))
          .toList(),
    );
  }

  /// Transform [CharacterModel] to [CharacterEntity].
  CharacterEntity transformCharacterModel({
    required CharacterModel characterModel,
  }) {
    return CharacterEntity(
      id: characterModel.id,
      name: characterModel.name,
      status:
          EnumToString.fromString(StatusType.values, characterModel.status) ??
              StatusType.unknown,
      species: characterModel.species,
      type: characterModel.type,
      gender:
          EnumToString.fromString(GenderType.values, characterModel.gender) ??
              GenderType.unknown,
      origin: _transformCharacterLocationModel(
          characterLocationModel: characterModel.origin),
      location: _transformCharacterLocationModel(
          characterLocationModel: characterModel.location),
      image: characterModel.image,
      episode: characterModel.episode,
      url: characterModel.url,
      created: characterModel.created,
    );
  }

  /// Transform [InfoModel] to [InfoEntity].
  InfoEntity _transformInfoModel({
    required InfoModel infoModel,
  }) {
    return InfoEntity(
      count: infoModel.count,
      pages: infoModel.pages,
    );
  }

  /// Transform [CharacterLocationModel] to [CharacterLocationEntity].
  CharacterLocationEntity _transformCharacterLocationModel({
    required CharacterLocationModel characterLocationModel,
  }) {
    return CharacterLocationEntity(
      name: characterLocationModel.name,
      url: characterLocationModel.url,
    );
  }
}
