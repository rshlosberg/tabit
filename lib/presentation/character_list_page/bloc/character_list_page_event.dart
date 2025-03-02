import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tabit/domain/entity/character_entity.dart';

/// The events of the character list page.
@immutable
abstract class CharacterListPageEvent extends Equatable {
  const CharacterListPageEvent();

  @override
  List<Object?> get props => [];
}

/// The init event of the character list page.
class CharactersListInitEvent extends CharacterListPageEvent {}

/// The load next page event of the character list page.
class LoadNextPageEvent extends CharacterListPageEvent {}

/// The filter changed event of the character list page.
class CharactersListFilterChangedEvent extends CharacterListPageEvent {
  final String? name;
  final StatusType? statusType;

  const CharactersListFilterChangedEvent({
    this.name,
    this.statusType,
  });
}
