import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tabit/domain/entity/character_entity.dart';
import 'package:tabit/domain/usecase/characters_use_case.dart';
import 'package:tabit/presentation/character_details_page/character_details_page_arguments.dart';
import 'package:tabit/presentation/character_list_page/bloc/character_list_page_event.dart';
import 'package:tabit/presentation/character_list_page/bloc/character_list_page_state.dart';

/// The bloc of the character list page.
class CharacterListPageBloc
    extends Bloc<CharacterListPageEvent, CharacterListPageState> {
  /// The use case to get the data.
  final CharactersUseCase charactersUseCase;

  /// Instance to the internet connection status.
  late final InternetConnectionChecker connectionChecker;

  /// The main subscription.
  late final CompositeSubscription compositeSubscription;

  /// The subject of changes of the search text.
  late final BehaviorSubject<String?> _searchTextSubject;

  /// The subject of changes of the status type.
  late final BehaviorSubject<StatusType?> _statusTypeSubject;

  /// The subject of requests to move to the character details page.
  late final BehaviorSubject<CharacterDetailsPageArguments>
      _moveToCharacterDetailPageRequests;

  /// The current page of the list.
  int _currentPage = 1;

  /// The status if the list is actual loading.
  bool _isActualLoading = false;

  /// The status if more data is available to fetch.
  bool _hasMoreData = true;

  CharacterListPageBloc({
    required this.charactersUseCase,
  }) : super(const CharacterListPageState.loading()) {
    // Init the connectionChecker.
    connectionChecker = InternetConnectionChecker.instance;
    // Init the compositeSubscription.
    compositeSubscription = CompositeSubscription();
    // Init the _searchTextSubject subject.
    _searchTextSubject = BehaviorSubject<String?>.seeded(null);
    // Init the _statusTypeSubject subject.
    _statusTypeSubject = BehaviorSubject<StatusType?>.seeded(null);
    // Init the _moveToCharacterDetailPageRequests subject.
    _moveToCharacterDetailPageRequests = BehaviorSubject();

    // Combine search text and status filter changes.
    CombineLatestStream.combine2(
      _searchTextSubject.distinct(),
      _statusTypeSubject.distinct(),
      (a, b) => (a, b),
    ).listen((value) {
      // Reset page when the search, or the status type, changed.
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

    /// Initial event to load characters.
    on<CharactersListInitEvent>((event, emit) async {
      // Reset page on init.
      _resetPage();
      // Fetch data.
      await _fetchCharacters(emit: emit);
    });

    /// Update filtering logic to properly emit the result.
    on<CharactersListFilterChangedEvent>((event, emit) async {
      // Reset page when filter changes.
      _resetPage();
      // Fetch new data, based on the new filter values.
      await _fetchCharacters(emit: emit);
    });

    /// Handle load next page request event.
    on<LoadNextPageEvent>((event, emit) async {
      // If possible, load next page.
      if (!_isActualLoading && _hasMoreData) {
        // Increase the current page index.
        _currentPage++;
        // Fetch next page's data.
        await _fetchCharacters(emit: emit, isLoadMore: true);
      }
    });

    // Trigger initial data load
    add(CharactersListInitEvent());
  }

  /// Reset page when init or a filter value changed.
  void _resetPage() {
    _currentPage = 1;
    _hasMoreData = true;
  }

  /// Fetch new characters.
  Future<void> _fetchCharacters({
    required Emitter<CharacterListPageState> emit,
    bool isLoadMore = false,
  }) async {
    // If actual loading, return.
    if (_isActualLoading) return;
    // Else, continue and mark as actual loading,
    // but don't change the whole list state to loading.
    _isActualLoading = true;

    try {
      // Get the characters page entity data of the page.
      final charactersPageEntity = await charactersUseCase
          .getCharactersInPage(
              page: _currentPage,
              name: _searchTextSubject.valueOrNull,
              statusType: _statusTypeSubject.valueOrNull)
          .first;

      if (charactersPageEntity.results.isNotEmpty) {
        // There are characters to show.
        List<CharacterItemView> currentCharacters = [];

        if (isLoadMore) {
          // Append new items to existing ones.
          final currentState = state;
          if (currentState is CharacterListPageSuccess) {
            currentCharacters = List.from(currentState.characters);
          }
        }

        // Append the new items.
        currentCharacters.addAll(charactersPageEntity.results
            .map((characterEntity) => CharacterItemView(
                  name: characterEntity.name,
                  species: characterEntity.species,
                  status: characterEntity.status,
                  image: characterEntity.image,
                  // Handle clicks on the character item views.
                  onClickCallback: () => _moveToCharacterDetailPage(
                      characterEntity: characterEntity),
                )));

        // Set if there are still more data to fetch.
        _hasMoreData = charactersPageEntity.results.isNotEmpty;
        // Emit the new success state.
        emit(CharacterListPageState.success(currentCharacters));
      } else {
        // There are no characters to show.
        _hasMoreData = false;
        // If the base request wasn't to show more data - this is the empty state.
        if (!isLoadMore) {
          // Check if there is internet connection.
          if (await connectionChecker.hasConnection) {
            // If there is an internet connection - emit the empty state.
            emit(const CharacterListPageState.empty("No characters found."));
          } else {
            // If there is no internet connection - emit the error state.
            emit(const CharacterListPageState.error(
              "No Internet connection.",
              "Please enable internet connection",
            ));
          }
        }
      }
    } catch (e) {
      // Catch errors.
      if (e is DioException) {
        if (e.response?.statusCode == 404) {
          emit(const CharacterListPageState.error(
            "404",
            "The requested resource was not found",
          ));
        } else {
          emit(CharacterListPageState.error(
            "An error occurred",
            e.message.toString(),
          ));
        }
      } else {
        emit(CharacterListPageState.error(
          "An unexpected error occurred",
          e.toString(),
        ));
      }
    }

    // Set the actual loading flag to false.
    _isActualLoading = false;
  }

  /// Get the stream of the subject of requests to move to the character details page.
  Stream<CharacterDetailsPageArguments>
      getMoveToCharacterDetailPageRequestsStream() {
    return _moveToCharacterDetailPageRequests;
  }

  /// Handle requests to move to the character details page.
  void _moveToCharacterDetailPage({
    required CharacterEntity characterEntity,
  }) {
    // Add a new request to move to the character details page to the
    // _moveToCharacterDetailPageRequests stream.
    _moveToCharacterDetailPageRequests
        .add(CharacterDetailsPageArguments(characterEntity: characterEntity));
  }

  /// Handle changes of the search text.
  void onSearchTextChanged({
    required String newText,
  }) {
    _searchTextSubject.add(newText);
  }

  /// Handle changes of the status type.
  void onStatusTypeChanged({
    required StatusType? newStatusType,
  }) {
    _statusTypeSubject.add(newStatusType);
  }

  /// Handle scroll reaches of the bottom of the list.
  void onBottomToBeReachByScroll() {
    add(LoadNextPageEvent());
  }

  /// Close streams.
  @override
  Future<void> close() {
    _moveToCharacterDetailPageRequests.close();
    _searchTextSubject.close();
    _statusTypeSubject.close();
    compositeSubscription.cancel();
    return super.close();
  }
}
