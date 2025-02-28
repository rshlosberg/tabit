import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabit/di/characters_injection.dart';
import 'package:tabit/domain/usecase/characters_use_case.dart';
import 'package:tabit/presentation/character_details_page/bloc/character_details_page_bloc.dart';
import 'package:tabit/presentation/character_details_page/bloc/character_details_page_state.dart';

class CharacterDetailsPage extends ConsumerWidget {
  const CharacterDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CharactersUseCase charactersUseCase =
        ref.watch(charactersUseCaseProvider);
    final arguments = ModalRoute.of(context)!.settings.arguments;
    return BlocProvider(
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
                    builder: (context, state) => state.when(
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      init: (characterDetailsView) => _AppBarTitle(
                        characterDetailsView: characterDetailsView,
                      ),
                      empty: (message) => Center(
                        child:
                            Text((state as CharacterDetailsPageEmpty).message),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            body: BlocBuilder<CharacterDetailsPageBloc,
                CharacterDetailsPageState>(
              builder: (context, state) => AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: state.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  init: (characterDetailsView) => _CoreDataWidget(
                      characterDetailsView: characterDetailsView),
                  empty: (message) => Center(
                    child: Text((state as CharacterDetailsPageEmpty).message),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  final CharacterDetailsView characterDetailsView;

  const _AppBarTitle({
    required this.characterDetailsView,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Hero(
          tag: characterDetailsView.image,
          child: CircleAvatar(
            radius: 75,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(characterDetailsView.image),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 50,
          child: AutoSizeText(
            "Name: ${characterDetailsView.name}",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
            maxLines: 1,
            minFontSize: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _CoreDataWidget extends StatelessWidget {
  final CharacterDetailsView characterDetailsView;

  const _CoreDataWidget({
    required this.characterDetailsView,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: AlignmentDirectional.topStart,
            padding: const EdgeInsets.all(10.0),
            child: AutoSizeText(
              "Species: ${characterDetailsView.species}",
              style: Theme.of(context).textTheme.titleLarge,
              minFontSize: 1,
            ),
          ),
          Container(
            alignment: AlignmentDirectional.topStart,
            padding: const EdgeInsets.all(10.0),
            child: AutoSizeText(
              "Status: ${characterDetailsView.status.name}",
              style: Theme.of(context).textTheme.titleLarge,
              minFontSize: 1,
            ),
          ),
          Container(
            alignment: AlignmentDirectional.topStart,
            padding: const EdgeInsets.all(10.0),
            child: AutoSizeText(
              "Gender: ${characterDetailsView.gender.name}",
              style: Theme.of(context).textTheme.titleLarge,
              minFontSize: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: AutoSizeText(
                "Origin:\nName: ${characterDetailsView.origin.name}\nUrl: ${characterDetailsView.origin.url}",
                style: Theme.of(context).textTheme.titleLarge,
                minFontSize: 1,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: AutoSizeText(
                "Location:\nName: ${characterDetailsView.location.name}\nUrl: ${characterDetailsView.location.url}",
                style: Theme.of(context).textTheme.titleLarge,
                minFontSize: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
