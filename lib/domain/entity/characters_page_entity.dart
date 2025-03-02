import 'package:equatable/equatable.dart';
import 'package:tabit/domain/entity/character_entity.dart';

/// The class which represent the character page's structure in the core of the app.
class CharactersPageEntity extends Equatable {
  /// An object with information about the response.
  final InfoEntity info;
  /// The page results.
  final List<CharacterEntity> results;

  const CharactersPageEntity({
    required this.info,
    required this.results,
  });

  @override
  List<Object?> get props => [info, results];
}

/// The information about the response.
class InfoEntity extends Equatable {
  /// The length of the response.
  final int count;
  /// The amount of pages.
  final int pages;
  /// Link to the next page (if it exists).
  final String? next;
  /// Link to the previous page (if it exists).
  final String? prev;

  const InfoEntity({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  @override
  List<Object?> get props => [count, pages, next, prev];
}
