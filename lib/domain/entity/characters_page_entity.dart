import 'package:equatable/equatable.dart';
import 'package:tabit/domain/entity/character_entity.dart';

class CharactersPageEntity extends Equatable {
  final InfoEntity info;
  final List<CharacterEntity> results;

  const CharactersPageEntity({
    required this.info,
    required this.results,
  });

  @override
  List<Object?> get props => [info, results];
}

class InfoEntity extends Equatable {
  final int count;
  final int pages;
  final String? next;
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
