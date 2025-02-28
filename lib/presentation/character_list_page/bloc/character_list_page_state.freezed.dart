// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'character_list_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CharacterListPageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<CharacterItemView> characters) success,
    required TResult Function(String message) empty,
    required TResult Function(String topMessage, String bottomMessage) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<CharacterItemView> characters)? success,
    TResult? Function(String message)? empty,
    TResult? Function(String topMessage, String bottomMessage)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<CharacterItemView> characters)? success,
    TResult Function(String message)? empty,
    TResult Function(String topMessage, String bottomMessage)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CharacterListPageLoading value) loading,
    required TResult Function(CharacterListPageSuccess value) success,
    required TResult Function(CharacterListPageEmpty value) empty,
    required TResult Function(CharacterListPageError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CharacterListPageLoading value)? loading,
    TResult? Function(CharacterListPageSuccess value)? success,
    TResult? Function(CharacterListPageEmpty value)? empty,
    TResult? Function(CharacterListPageError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CharacterListPageLoading value)? loading,
    TResult Function(CharacterListPageSuccess value)? success,
    TResult Function(CharacterListPageEmpty value)? empty,
    TResult Function(CharacterListPageError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CharacterListPageStateCopyWith<$Res> {
  factory $CharacterListPageStateCopyWith(CharacterListPageState value,
          $Res Function(CharacterListPageState) then) =
      _$CharacterListPageStateCopyWithImpl<$Res, CharacterListPageState>;
}

/// @nodoc
class _$CharacterListPageStateCopyWithImpl<$Res,
        $Val extends CharacterListPageState>
    implements $CharacterListPageStateCopyWith<$Res> {
  _$CharacterListPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CharacterListPageState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CharacterListPageLoadingImplCopyWith<$Res> {
  factory _$$CharacterListPageLoadingImplCopyWith(
          _$CharacterListPageLoadingImpl value,
          $Res Function(_$CharacterListPageLoadingImpl) then) =
      __$$CharacterListPageLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CharacterListPageLoadingImplCopyWithImpl<$Res>
    extends _$CharacterListPageStateCopyWithImpl<$Res,
        _$CharacterListPageLoadingImpl>
    implements _$$CharacterListPageLoadingImplCopyWith<$Res> {
  __$$CharacterListPageLoadingImplCopyWithImpl(
      _$CharacterListPageLoadingImpl _value,
      $Res Function(_$CharacterListPageLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CharacterListPageState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CharacterListPageLoadingImpl extends CharacterListPageLoading {
  const _$CharacterListPageLoadingImpl() : super._();

  @override
  String toString() {
    return 'CharacterListPageState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterListPageLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<CharacterItemView> characters) success,
    required TResult Function(String message) empty,
    required TResult Function(String topMessage, String bottomMessage) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<CharacterItemView> characters)? success,
    TResult? Function(String message)? empty,
    TResult? Function(String topMessage, String bottomMessage)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<CharacterItemView> characters)? success,
    TResult Function(String message)? empty,
    TResult Function(String topMessage, String bottomMessage)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CharacterListPageLoading value) loading,
    required TResult Function(CharacterListPageSuccess value) success,
    required TResult Function(CharacterListPageEmpty value) empty,
    required TResult Function(CharacterListPageError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CharacterListPageLoading value)? loading,
    TResult? Function(CharacterListPageSuccess value)? success,
    TResult? Function(CharacterListPageEmpty value)? empty,
    TResult? Function(CharacterListPageError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CharacterListPageLoading value)? loading,
    TResult Function(CharacterListPageSuccess value)? success,
    TResult Function(CharacterListPageEmpty value)? empty,
    TResult Function(CharacterListPageError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CharacterListPageLoading extends CharacterListPageState {
  const factory CharacterListPageLoading() = _$CharacterListPageLoadingImpl;
  const CharacterListPageLoading._() : super._();
}

/// @nodoc
abstract class _$$CharacterListPageSuccessImplCopyWith<$Res> {
  factory _$$CharacterListPageSuccessImplCopyWith(
          _$CharacterListPageSuccessImpl value,
          $Res Function(_$CharacterListPageSuccessImpl) then) =
      __$$CharacterListPageSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CharacterItemView> characters});
}

/// @nodoc
class __$$CharacterListPageSuccessImplCopyWithImpl<$Res>
    extends _$CharacterListPageStateCopyWithImpl<$Res,
        _$CharacterListPageSuccessImpl>
    implements _$$CharacterListPageSuccessImplCopyWith<$Res> {
  __$$CharacterListPageSuccessImplCopyWithImpl(
      _$CharacterListPageSuccessImpl _value,
      $Res Function(_$CharacterListPageSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of CharacterListPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? characters = null,
  }) {
    return _then(_$CharacterListPageSuccessImpl(
      null == characters
          ? _value._characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<CharacterItemView>,
    ));
  }
}

/// @nodoc

class _$CharacterListPageSuccessImpl extends CharacterListPageSuccess {
  const _$CharacterListPageSuccessImpl(final List<CharacterItemView> characters)
      : _characters = characters,
        super._();

  final List<CharacterItemView> _characters;
  @override
  List<CharacterItemView> get characters {
    if (_characters is EqualUnmodifiableListView) return _characters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_characters);
  }

  @override
  String toString() {
    return 'CharacterListPageState.success(characters: $characters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterListPageSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._characters, _characters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_characters));

  /// Create a copy of CharacterListPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterListPageSuccessImplCopyWith<_$CharacterListPageSuccessImpl>
      get copyWith => __$$CharacterListPageSuccessImplCopyWithImpl<
          _$CharacterListPageSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<CharacterItemView> characters) success,
    required TResult Function(String message) empty,
    required TResult Function(String topMessage, String bottomMessage) error,
  }) {
    return success(characters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<CharacterItemView> characters)? success,
    TResult? Function(String message)? empty,
    TResult? Function(String topMessage, String bottomMessage)? error,
  }) {
    return success?.call(characters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<CharacterItemView> characters)? success,
    TResult Function(String message)? empty,
    TResult Function(String topMessage, String bottomMessage)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(characters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CharacterListPageLoading value) loading,
    required TResult Function(CharacterListPageSuccess value) success,
    required TResult Function(CharacterListPageEmpty value) empty,
    required TResult Function(CharacterListPageError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CharacterListPageLoading value)? loading,
    TResult? Function(CharacterListPageSuccess value)? success,
    TResult? Function(CharacterListPageEmpty value)? empty,
    TResult? Function(CharacterListPageError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CharacterListPageLoading value)? loading,
    TResult Function(CharacterListPageSuccess value)? success,
    TResult Function(CharacterListPageEmpty value)? empty,
    TResult Function(CharacterListPageError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CharacterListPageSuccess extends CharacterListPageState {
  const factory CharacterListPageSuccess(
          final List<CharacterItemView> characters) =
      _$CharacterListPageSuccessImpl;
  const CharacterListPageSuccess._() : super._();

  List<CharacterItemView> get characters;

  /// Create a copy of CharacterListPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterListPageSuccessImplCopyWith<_$CharacterListPageSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CharacterListPageEmptyImplCopyWith<$Res> {
  factory _$$CharacterListPageEmptyImplCopyWith(
          _$CharacterListPageEmptyImpl value,
          $Res Function(_$CharacterListPageEmptyImpl) then) =
      __$$CharacterListPageEmptyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CharacterListPageEmptyImplCopyWithImpl<$Res>
    extends _$CharacterListPageStateCopyWithImpl<$Res,
        _$CharacterListPageEmptyImpl>
    implements _$$CharacterListPageEmptyImplCopyWith<$Res> {
  __$$CharacterListPageEmptyImplCopyWithImpl(
      _$CharacterListPageEmptyImpl _value,
      $Res Function(_$CharacterListPageEmptyImpl) _then)
      : super(_value, _then);

  /// Create a copy of CharacterListPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$CharacterListPageEmptyImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CharacterListPageEmptyImpl extends CharacterListPageEmpty {
  const _$CharacterListPageEmptyImpl(this.message) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'CharacterListPageState.empty(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterListPageEmptyImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of CharacterListPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterListPageEmptyImplCopyWith<_$CharacterListPageEmptyImpl>
      get copyWith => __$$CharacterListPageEmptyImplCopyWithImpl<
          _$CharacterListPageEmptyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<CharacterItemView> characters) success,
    required TResult Function(String message) empty,
    required TResult Function(String topMessage, String bottomMessage) error,
  }) {
    return empty(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<CharacterItemView> characters)? success,
    TResult? Function(String message)? empty,
    TResult? Function(String topMessage, String bottomMessage)? error,
  }) {
    return empty?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<CharacterItemView> characters)? success,
    TResult Function(String message)? empty,
    TResult Function(String topMessage, String bottomMessage)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CharacterListPageLoading value) loading,
    required TResult Function(CharacterListPageSuccess value) success,
    required TResult Function(CharacterListPageEmpty value) empty,
    required TResult Function(CharacterListPageError value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CharacterListPageLoading value)? loading,
    TResult? Function(CharacterListPageSuccess value)? success,
    TResult? Function(CharacterListPageEmpty value)? empty,
    TResult? Function(CharacterListPageError value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CharacterListPageLoading value)? loading,
    TResult Function(CharacterListPageSuccess value)? success,
    TResult Function(CharacterListPageEmpty value)? empty,
    TResult Function(CharacterListPageError value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class CharacterListPageEmpty extends CharacterListPageState {
  const factory CharacterListPageEmpty(final String message) =
      _$CharacterListPageEmptyImpl;
  const CharacterListPageEmpty._() : super._();

  String get message;

  /// Create a copy of CharacterListPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterListPageEmptyImplCopyWith<_$CharacterListPageEmptyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CharacterListPageErrorImplCopyWith<$Res> {
  factory _$$CharacterListPageErrorImplCopyWith(
          _$CharacterListPageErrorImpl value,
          $Res Function(_$CharacterListPageErrorImpl) then) =
      __$$CharacterListPageErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String topMessage, String bottomMessage});
}

/// @nodoc
class __$$CharacterListPageErrorImplCopyWithImpl<$Res>
    extends _$CharacterListPageStateCopyWithImpl<$Res,
        _$CharacterListPageErrorImpl>
    implements _$$CharacterListPageErrorImplCopyWith<$Res> {
  __$$CharacterListPageErrorImplCopyWithImpl(
      _$CharacterListPageErrorImpl _value,
      $Res Function(_$CharacterListPageErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of CharacterListPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topMessage = null,
    Object? bottomMessage = null,
  }) {
    return _then(_$CharacterListPageErrorImpl(
      null == topMessage
          ? _value.topMessage
          : topMessage // ignore: cast_nullable_to_non_nullable
              as String,
      null == bottomMessage
          ? _value.bottomMessage
          : bottomMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CharacterListPageErrorImpl extends CharacterListPageError {
  const _$CharacterListPageErrorImpl(this.topMessage, this.bottomMessage)
      : super._();

  @override
  final String topMessage;
  @override
  final String bottomMessage;

  @override
  String toString() {
    return 'CharacterListPageState.error(topMessage: $topMessage, bottomMessage: $bottomMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CharacterListPageErrorImpl &&
            (identical(other.topMessage, topMessage) ||
                other.topMessage == topMessage) &&
            (identical(other.bottomMessage, bottomMessage) ||
                other.bottomMessage == bottomMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, topMessage, bottomMessage);

  /// Create a copy of CharacterListPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CharacterListPageErrorImplCopyWith<_$CharacterListPageErrorImpl>
      get copyWith => __$$CharacterListPageErrorImplCopyWithImpl<
          _$CharacterListPageErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<CharacterItemView> characters) success,
    required TResult Function(String message) empty,
    required TResult Function(String topMessage, String bottomMessage) error,
  }) {
    return error(topMessage, bottomMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<CharacterItemView> characters)? success,
    TResult? Function(String message)? empty,
    TResult? Function(String topMessage, String bottomMessage)? error,
  }) {
    return error?.call(topMessage, bottomMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<CharacterItemView> characters)? success,
    TResult Function(String message)? empty,
    TResult Function(String topMessage, String bottomMessage)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(topMessage, bottomMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CharacterListPageLoading value) loading,
    required TResult Function(CharacterListPageSuccess value) success,
    required TResult Function(CharacterListPageEmpty value) empty,
    required TResult Function(CharacterListPageError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CharacterListPageLoading value)? loading,
    TResult? Function(CharacterListPageSuccess value)? success,
    TResult? Function(CharacterListPageEmpty value)? empty,
    TResult? Function(CharacterListPageError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CharacterListPageLoading value)? loading,
    TResult Function(CharacterListPageSuccess value)? success,
    TResult Function(CharacterListPageEmpty value)? empty,
    TResult Function(CharacterListPageError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CharacterListPageError extends CharacterListPageState {
  const factory CharacterListPageError(
          final String topMessage, final String bottomMessage) =
      _$CharacterListPageErrorImpl;
  const CharacterListPageError._() : super._();

  String get topMessage;
  String get bottomMessage;

  /// Create a copy of CharacterListPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CharacterListPageErrorImplCopyWith<_$CharacterListPageErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
