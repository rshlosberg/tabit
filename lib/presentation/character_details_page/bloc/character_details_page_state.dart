import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tabit/domain/entity/character_entity.dart';

part 'character_details_page_state.freezed.dart';

@freezed
class CharacterDetailsPageState with _$CharacterDetailsPageState {
  const CharacterDetailsPageState._();

  const factory CharacterDetailsPageState.loading() =
      CharacterDetailsPageLoading;

  const factory CharacterDetailsPageState.init(
      CharacterDetailsView characterDetailsView) = CharacterDetailsPageInit;

  const factory CharacterDetailsPageState.empty(String message) =
      CharacterDetailsPageEmpty;
}

class CharacterDetailsView {
  final String name;
  final String species;
  final StatusType status;
  final GenderType gender;
  final CharacterLocationEntity origin;
  final CharacterLocationEntity location;
  final String image;

  const CharacterDetailsView({
    required this.name,
    required this.species,
    required this.status,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
  });
}
