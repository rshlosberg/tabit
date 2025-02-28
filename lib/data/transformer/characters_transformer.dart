import 'package:enum_to_string/enum_to_string.dart';
import 'package:tabit/data/model/character_model.dart';
import 'package:tabit/data/model/character_page_model.dart';
import 'package:tabit/data/model/container_response_model.dart';
import 'package:tabit/domain/entity/character_entity.dart';
import 'package:tabit/domain/entity/characters_page_entity.dart';

class CharactersTransformer {
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

  InfoEntity _transformInfoModel({
    required InfoModel infoModel,
  }) {
    return InfoEntity(
      count: infoModel.count,
      pages: infoModel.pages,
    );
  }

  CharacterLocationEntity _transformCharacterLocationModel({
    required CharacterLocationModel characterLocationModel,
  }) {
    return CharacterLocationEntity(
      name: characterLocationModel.name,
      url: characterLocationModel.url,
    );
  }
}
