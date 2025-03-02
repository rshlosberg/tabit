import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// The events of the character details page.
@immutable
abstract class CharacterDetailsPageEvent extends Equatable {
  const CharacterDetailsPageEvent();

  @override
  List<Object?> get props => [];
}

/// The init event of the character details page.
class CharacterDetailsPageInitEvent extends CharacterDetailsPageEvent {}
