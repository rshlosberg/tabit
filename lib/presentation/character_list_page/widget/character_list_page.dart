import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabit/di/characters_injection.dart';
import 'package:tabit/domain/usecase/characters_use_case.dart';
import 'package:tabit/presentation/character_details_page/character_details_page_arguments.dart';
import 'package:tabit/presentation/character_list_page/bloc/character_list_page_bloc.dart';
import 'package:tabit/presentation/character_list_page/bloc/character_list_page_state.dart';
import 'package:tabit/presentation/character_list_page/widget/inner_widgets/search_bar.dart';
import 'package:tabit/presentation/character_list_page/widget/inner_widgets/status_dropdown.dart';
import 'package:tabit/route.dart';

/// The character list page.
class CharacterListPage extends ConsumerWidget {
  const CharacterListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CharactersUseCase charactersUseCase =
        ref.watch(charactersUseCaseProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          // Prevents keyboard from pushing UI
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const SizedBox(
              height: kToolbarHeight,
              child: Center(
                child: Text("Tabit"),
              ),
            ),
          ),
          body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                currentFocus.unfocus();
              }
            },
            child: BlocProvider(
              // Create the related bloc.
              create: (context) =>
                  CharacterListPageBloc(charactersUseCase: charactersUseCase),
              child: Builder(builder: (context) {
                return _CoreWidget(
                  characterListPageBloc:
                      BlocProvider.of<CharacterListPageBloc>(context),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}

/// The core widget of this character list page.
class _CoreWidget extends StatefulWidget {
  final CharacterListPageBloc characterListPageBloc;

  const _CoreWidget({
    required this.characterListPageBloc,
  });

  @override
  _CoreWidgetState createState() => _CoreWidgetState();
}

class _CoreWidgetState extends State<_CoreWidget> {
  /// A subscription of CharacterDetailsPageArguments.
  late final StreamSubscription<CharacterDetailsPageArguments> _subscription;

  @override
  void initState() {
    super.initState();
    // Listen to the related bloc's requests to move to the details page,
    // if possible, and pass it the arguments.
    _subscription = widget.characterListPageBloc
        .getMoveToCharacterDetailPageRequestsStream()
        .listen((arguments) {
      if (!mounted) return;
      Navigator.pushNamed(
        context,
        RouteScreens.characterDetailsPage,
        arguments: arguments,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // The search bar to filter characters.
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchBarWidget(
              characterListPageBloc: widget.characterListPageBloc),
        ),
        // The status type dropdown to filter characters.
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: StatusDropdown(
              characterListPageBloc: widget.characterListPageBloc),
        ),
        // The character list.
        Expanded(
          child: BlocBuilder<CharacterListPageBloc, CharacterListPageState>(
            builder: (context, state) {
              // Handle the states.
              final Widget bodyWidget = state.maybeWhen(
                loading: () => const Center(child: CircularProgressIndicator()),
                success: (characters) => _SuccessWidget(
                  characterListPageBloc: widget.characterListPageBloc,
                  characters: characters,
                ),
                empty: (message) => Center(
                  child: Text((state as CharacterListPageEmpty).message),
                ),
                error: (code, message) {
                  // When error, show the input messages.
                  final stateData = (state as CharacterListPageError);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(stateData.topMessage),
                      Text(stateData.bottomMessage),
                    ],
                  );
                },
                orElse: () => Container(),
              );

              return Container(
                color: Colors.black12,
                padding: const EdgeInsets.all(8.0),
                child: bodyWidget,
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

/// The widget to show when a success state emitted.
class _SuccessWidget extends StatefulWidget {
  final CharacterListPageBloc characterListPageBloc;
  final List<CharacterItemView> characters;

  const _SuccessWidget({
    required this.characterListPageBloc,
    required this.characters,
  });

  @override
  State<_SuccessWidget> createState() => _SuccessWidgetState();
}

class _SuccessWidgetState extends State<_SuccessWidget> {
  /// The scroll controller of the list.
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // Trigger pagination when reaching 200px from the bottom.
      widget.characterListPageBloc.onBottomToBeReachByScroll();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.only(bottom: 50.0),
      itemBuilder: (context, index) => SizedBox(
        height: 120,
        child: GestureDetector(
          onTap: widget.characters[index].onClickCallback,
          child: Card(
            child: Padding(
              padding: const EdgeInsetsDirectional.all(8.0),
              child: Row(
                children: [
                  // The character image.
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: Hero(
                        tag: widget.characters[index].image,
                        child: Image.network(widget.characters[index].image)),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // The character name.
                        Text(
                          "Name: ${widget.characters[index].name}",
                          overflow: TextOverflow.ellipsis,
                        ),
                        // The character species.
                        Text(
                          "Species: ${widget.characters[index].species}",
                          overflow: TextOverflow.ellipsis,
                        ),
                        // The character status type.
                        Text(
                          "Status: ${widget.characters[index].status.name}",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      separatorBuilder: (_, index) => const SizedBox(height: 1),
      itemCount: widget.characters.length,
    );
  }

  @override
  void dispose() {
    // Dispose the scroll controller.
    _scrollController.dispose();
    super.dispose();
  }
}
