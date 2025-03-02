import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tabit/domain/entity/character_entity.dart';

part 'character_list_page_state.freezed.dart';

/// The states of the character list page.
@freezed
class CharacterListPageState with _$CharacterListPageState {
  const CharacterListPageState._();

  const factory CharacterListPageState.loading() = CharacterListPageLoading;

  const factory CharacterListPageState.success(
      List<CharacterItemView> characters) = CharacterListPageSuccess;

  const factory CharacterListPageState.empty(String message) =
      CharacterListPageEmpty;

  const factory CharacterListPageState.error(
      String topMessage, String bottomMessage) = CharacterListPageError;
}

/// The success state's data object.
class CharacterItemView {
  final String name;
  final String species;
  final StatusType status;
  final String image;
  final void Function()? onClickCallback;

  const CharacterItemView({
    required this.name,
    required this.species,
    required this.status,
    required this.image,
    required this.onClickCallback,
  });
}
