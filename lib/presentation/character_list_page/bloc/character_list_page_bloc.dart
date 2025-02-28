import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tabit/domain/entity/character_entity.dart';
import 'package:tabit/domain/entity/characters_page_entity.dart';
import 'package:tabit/domain/usecase/characters_use_case.dart';
import 'package:tabit/presentation/character_details_page/character_details_page_arguments.dart';
import 'package:tabit/presentation/character_list_page/bloc/character_list_page_event.dart';
import 'package:tabit/presentation/character_list_page/bloc/character_list_page_state.dart';

class CharacterListPageBloc
    extends Bloc<CharacterListPageEvent, CharacterListPageState> {
  final CharactersUseCase charactersUseCase;
  late final InternetConnectionChecker connectionChecker;

  late final CompositeSubscription compositeSubscription;
  late final BehaviorSubject<String?> _searchTextSubject;
  late final BehaviorSubject<StatusType?> _statusTypeSubject;
  late final BehaviorSubject<CharacterDetailsPageArguments>
      _moveToCharacterDetailPageRequests;

  // Pagination
  int _currentPage = 1;
  bool _isLoading = false;

  // Track if more data is available
  bool _hasMoreData = true;

  CharacterListPageBloc({
    required this.charactersUseCase,
  }) : super(const CharacterListPageState.loading()) {
    connectionChecker = InternetConnectionChecker.instance;
    compositeSubscription = CompositeSubscription();
    _searchTextSubject = BehaviorSubject<String?>.seeded(null);
    _statusTypeSubject = BehaviorSubject<StatusType?>.seeded(null);
    _moveToCharacterDetailPageRequests = BehaviorSubject();

    // Combine search text and status filter changes.
    CombineLatestStream.combine2(
      _searchTextSubject.distinct(),
      _statusTypeSubject.distinct(),
      (a, b) => (a, b),
    ).listen((value) {
      // Reset page when the search, or the status type changed.
      _currentPage = 1;
      _hasMoreData = true;

      // Add event to get the new data.
      add(
        CharactersListFilterChangedEvent(
          name: value.$1,
          statusType: value.$2,
        ),
      );
    }).addTo(compositeSubscription);

    // Initial event to load characters
    on<CharactersListInitEvent>((event, emit) async {
      // Reset page on init.
      _resetPage();
      await _fetchCharacters(emit: emit);
    });

    // Update filtering logic to properly emit the result
    on<CharactersListFilterChangedEvent>((event, emit) async {
      // Reset page when filter changes
      _resetPage();
      await _fetchCharacters(emit: emit);
    });

    on<LoadNextPageEvent>((event, emit) async {
      if (!_isLoading && _hasMoreData) {
        _currentPage++;
        await _fetchCharacters(emit: emit, isLoadMore: true);
      }
    });

    // Trigger initial data load
    add(CharactersListInitEvent());
  }

  void _resetPage() {
    // Reset page when init or a filter value changed.
    _currentPage = 1;
    _hasMoreData = true;
  }

  Future<void> _fetchCharacters({
    required Emitter<CharacterListPageState> emit,
    bool isLoadMore = false,
  }) async {
    if (_isLoading) return;
    _isLoading = true;

    try {
      final charactersPageEntity = await charactersUseCase
          .getCharactersInPage(
              page: _currentPage,
              name: _searchTextSubject.valueOrNull,
              statusType: _statusTypeSubject.valueOrNull)
          .first;

      if (charactersPageEntity.results.isNotEmpty) {
        List<CharacterItemView> currentCharacters = [];

        if (isLoadMore) {
          // Append new items to existing ones
          final currentState = state;
          if (currentState is CharacterListPageSuccess) {
            currentCharacters = List.from(currentState.characters);
          }
        }

        currentCharacters.addAll(charactersPageEntity.results
            .map((characterEntity) => CharacterItemView(
                  name: characterEntity.name,
                  species: characterEntity.species,
                  status: characterEntity.status,
                  image: characterEntity.image,
                  onClickCallback: () => _moveToCharacterDetailPage(
                      characterEntity: characterEntity),
                )));

        _hasMoreData = charactersPageEntity.results.isNotEmpty;
        emit(CharacterListPageState.success(currentCharacters));
      } else {
        _hasMoreData = false;
        if (!isLoadMore) {
          emit(const CharacterListPageState.empty("No characters found."));
        }
      }
    } catch (e) {
      if (!isLoadMore) {
        emit(CharacterListPageState.error("Error", e.toString()));
      }
    }

    _isLoading = false;
  }

  Stream<CharacterDetailsPageArguments>
      getMoveToCharacterDetailPageRequestsStream() {
    return _moveToCharacterDetailPageRequests;
  }

  void _moveToCharacterDetailPage({
    required CharacterEntity characterEntity,
  }) {
    _moveToCharacterDetailPageRequests
        .add(CharacterDetailsPageArguments(characterEntity: characterEntity));
  }

  @override
  Future<void> close() {
    _moveToCharacterDetailPageRequests.close();
    _searchTextSubject.close();
    _statusTypeSubject.close();
    compositeSubscription.cancel();
    return super.close();
  }

  void onSearchTextChanged({
    required String newText,
  }) {
    _searchTextSubject.add(newText);
  }

  void onStatusTypeChanged({
    required StatusType? newStatusType,
  }) {
    _statusTypeSubject.add(newStatusType);
  }

  Future<CharacterListPageState> _searchCharacters({
    required Future<CharactersPageEntity> future,
  }) async {
    try {
      final charactersPageEntity = await future;

      if (charactersPageEntity.results.isNotEmpty) {
        return CharacterListPageState.success(
          charactersPageEntity.results
              .map(
                (characterEntity) => CharacterItemView(
                  name: characterEntity.name,
                  species: characterEntity.species,
                  status: characterEntity.status,
                  image: characterEntity.image,
                  onClickCallback: () => _moveToCharacterDetailPage(
                      characterEntity: characterEntity),
                ),
              )
              .toList(),
        );
      } else if (await connectionChecker.hasConnection) {
        return const CharacterListPageState.empty("Empty list :(");
      } else {
        return const CharacterListPageState.empty(
            "Empty list :(\n\nPlease enable internet connection");
      }
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 404) {
          return const CharacterListPageState.error(
            "404",
            "The requested resource was not found",
          );
        } else {
          return CharacterListPageState.error(
            "An error occurred",
            e.message.toString(),
          );
        }
      } else {
        return CharacterListPageState.error(
          "An unexpected error occurred",
          e.toString(),
        );
      }
    }
  }

  void onBottomToBeReachByScroll() {
    add(LoadNextPageEvent());
  }
}
