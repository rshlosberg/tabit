import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tabit/domain/entity/character_entity.dart';

@immutable
abstract class CharacterListPageEvent extends Equatable {
  const CharacterListPageEvent();

  @override
  List<Object?> get props => [];
}

class CharactersListInitEvent extends CharacterListPageEvent {}

class LoadNextPageEvent extends CharacterListPageEvent {}

class CharactersListFilterChangedEvent extends CharacterListPageEvent {
  final String? name;
  final StatusType? statusType;

  const CharactersListFilterChangedEvent({
    this.name,
    this.statusType,
  });
}
