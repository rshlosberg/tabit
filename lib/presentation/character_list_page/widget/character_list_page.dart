import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tabit/di/characters_injection.dart';
import 'package:tabit/domain/usecase/characters_use_case.dart';
import 'package:tabit/presentation/character_details_page/character_details_page_arguments.dart';
import 'package:tabit/presentation/character_list_page/bloc/character_list_page_bloc.dart';
import 'package:tabit/presentation/character_list_page/bloc/character_list_page_state.dart';
import 'package:tabit/presentation/character_list_page/widget/search_bar.dart';
import 'package:tabit/presentation/character_list_page/widget/status_dropdown.dart';
import 'package:tabit/route.dart';

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
          resizeToAvoidBottomInset: false, // Prevents keyboard from pushing UI
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

class _CoreWidget extends StatefulWidget {
  final CharacterListPageBloc characterListPageBloc;

  const _CoreWidget({required this.characterListPageBloc});

  @override
  _CoreWidgetState createState() => _CoreWidgetState();
}

class _CoreWidgetState extends State<_CoreWidget> {
  late final StreamSubscription<CharacterDetailsPageArguments> _subscription;

  @override
  void initState() {
    super.initState();
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchBarWidget(
              characterListPageBloc: widget.characterListPageBloc),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: StatusDropdown(
              characterListPageBloc: widget.characterListPageBloc),
        ),
        Expanded(
          child: BlocBuilder<CharacterListPageBloc, CharacterListPageState>(
            builder: (context, state) {
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
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
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
                        Text(
                          "Name: ${widget.characters[index].name}",
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Species: ${widget.characters[index].species}",
                          overflow: TextOverflow.ellipsis,
                        ),
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
    _scrollController.dispose();
    super.dispose();
  }
}
