// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterPageModel _$CharacterPageModelFromJson(Map<String, dynamic> json) =>
    CharacterPageModel(
      info: InfoModel.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterPageModelToJson(CharacterPageModel instance) =>
    <String, dynamic>{
      'info': instance.info.toJson(),
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
