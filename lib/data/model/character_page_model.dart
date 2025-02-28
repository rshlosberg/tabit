import 'package:json_annotation/json_annotation.dart';
import 'package:tabit/data/model/character_model.dart';
import 'package:tabit/data/model/container_response_model.dart';

part 'character_page_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CharacterPageModel extends ContainerResponseModel<CharacterModel> {
  const CharacterPageModel({
    required super.info,
    required super.results,
  });

  factory CharacterPageModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterPageModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterPageModelToJson(this);
}
