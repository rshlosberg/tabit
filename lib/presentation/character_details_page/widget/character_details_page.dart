import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabit/di/characters_injection.dart';
import 'package:tabit/domain/usecase/characters_use_case.dart';
import 'package:tabit/presentation/character_details_page/bloc/character_details_page_bloc.dart';
import 'package:tabit/presentation/character_details_page/bloc/character_details_page_state.dart';
import 'package:tabit/presentation/character_details_page/widget/inner_widgets/app_bar_title.dart';
import 'package:tabit/presentation/character_details_page/widget/inner_widgets/core_data.dart';

/// The character details page.
class CharacterDetailsPage extends ConsumerWidget {
  const CharacterDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// An instance of the CharactersUseCase.
    final CharactersUseCase charactersUseCase =
        ref.watch(charactersUseCaseProvider);

    /// The input arguments of this page.
    final arguments = ModalRoute.of(context)!.settings.arguments;

    return BlocProvider(
      // Create the related bloc.
      create: (context) => CharacterDetailsPageBloc(
        charactersUseCase: charactersUseCase,
        arguments: arguments,
      ),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.blue,
                      Colors.lightBlueAccent,
                    ],
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(230.0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Colors.blue,
                        Colors.lightBlueAccent,
                      ],
                    ),
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10.0),
                  child: BlocBuilder<CharacterDetailsPageBloc,
                      CharacterDetailsPageState>(
                    builder: (context, state) {
                      // Handle the states.
                      return state.when(
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        init: (characterDetailsView) => AppBarTitle(
                          characterDetailsView: characterDetailsView,
                        ),
                        empty: (message) => Center(
                          child: Text(
                              (state as CharacterDetailsPageEmpty).message),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            body: BlocBuilder<CharacterDetailsPageBloc,
                CharacterDetailsPageState>(
              builder: (context, state) {
                // Handle the states.
                return state.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  init: (characterDetailsView) =>
                      CoreData(characterDetailsView: characterDetailsView),
                  empty: (message) => Center(
                    child: Text((state as CharacterDetailsPageEmpty).message),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
