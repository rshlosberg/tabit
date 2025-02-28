import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tabit/domain/entity/character_entity.dart';
import 'package:tabit/domain/usecase/characters_use_case.dart';
import 'package:tabit/presentation/character_details_page/bloc/character_details_page_event.dart';
import 'package:tabit/presentation/character_details_page/bloc/character_details_page_state.dart';
import 'package:tabit/presentation/character_details_page/character_details_page_arguments.dart';

class CharacterDetailsPageBloc
    extends Bloc<CharacterDetailsPageEvent, CharacterDetailsPageState> {
  final CharactersUseCase charactersUseCase;
  final Object? arguments;
  late final InternetConnectionChecker connectionChecker;

  CharacterDetailsPageBloc({
    required this.charactersUseCase,
    this.arguments,
  }) : super(const CharacterDetailsPageState.loading()) {
    connectionChecker = InternetConnectionChecker.instance;

    on<CharacterDetailsPageInitEvent>((event, emit) async {
      emit(const CharacterDetailsPageState.loading());
      if (arguments != null && arguments is CharacterDetailsPageArguments) {
        final CharacterEntity characterEntity =
            (arguments as CharacterDetailsPageArguments).characterEntity;
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
        emit(const CharacterDetailsPageState.empty("Empty :("));
      }
    });

    add(CharacterDetailsPageInitEvent());
  }
}
