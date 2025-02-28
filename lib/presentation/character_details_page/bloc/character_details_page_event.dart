import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CharacterDetailsPageEvent extends Equatable {
  const CharacterDetailsPageEvent();

  @override
  List<Object?> get props => [];
}

class CharacterDetailsPageInitEvent extends CharacterDetailsPageEvent {}
