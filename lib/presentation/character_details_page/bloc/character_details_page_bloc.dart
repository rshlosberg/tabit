import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabit/domain/entity/character_entity.dart';
import 'package:tabit/domain/usecase/characters_use_case.dart';
import 'package:tabit/presentation/character_details_page/bloc/character_details_page_event.dart';
import 'package:tabit/presentation/character_details_page/bloc/character_details_page_state.dart';
import 'package:tabit/presentation/character_details_page/character_details_page_arguments.dart';

/// The bloc of the character details page.
class CharacterDetailsPageBloc
    extends Bloc<CharacterDetailsPageEvent, CharacterDetailsPageState> {
  /// The use case to get the data.
  final CharactersUseCase charactersUseCase;

  /// The arguments passed to the character details page.
  final Object? arguments;

  CharacterDetailsPageBloc({
    required this.charactersUseCase,
    this.arguments,
  }) : super(const CharacterDetailsPageState.loading()) {
    on<CharacterDetailsPageInitEvent>((event, emit) async {
      emit(const CharacterDetailsPageState.loading());
      // Try to parse the input arguments.
      if (arguments != null && arguments is CharacterDetailsPageArguments) {
        final CharacterEntity characterEntity =
            (arguments as CharacterDetailsPageArguments).characterEntity;
        // Emit the the init (the basic state).
        emit(
          CharacterDetailsPageState.init(
            CharacterDetailsView(
              name: characterEntity.name,
              species: characterEntity.species,
              status: characterEntity.status,
              gender: characterEntity.gender,
              origin: characterEntity.origin,
              location: characterEntity.location,
              image: characterEntity.image,
            ),
          ),
        );
      } else {
        // Show an empty message.
        emit(const CharacterDetailsPageState.empty("Empty :("));
      }
    });

    add(CharacterDetailsPageInitEvent());
  }
}
