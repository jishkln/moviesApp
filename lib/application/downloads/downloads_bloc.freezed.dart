// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'downloads_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DownloadsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getDownloadsEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getDownloadsEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getDownloadsEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getDownloadsEvent value) getDownloadsEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_getDownloadsEvent value)? getDownloadsEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getDownloadsEvent value)? getDownloadsEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadsEventCopyWith<$Res> {
  factory $DownloadsEventCopyWith(
          DownloadsEvent value, $Res Function(DownloadsEvent) then) =
      _$DownloadsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$DownloadsEventCopyWithImpl<$Res>
    implements $DownloadsEventCopyWith<$Res> {
  _$DownloadsEventCopyWithImpl(this._value, this._then);

  final DownloadsEvent _value;
  // ignore: unused_field
  final $Res Function(DownloadsEvent) _then;
}

/// @nodoc
abstract class _$$_getDownloadsEventCopyWith<$Res> {
  factory _$$_getDownloadsEventCopyWith(_$_getDownloadsEvent value,
          $Res Function(_$_getDownloadsEvent) then) =
      __$$_getDownloadsEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_getDownloadsEventCopyWithImpl<$Res>
    extends _$DownloadsEventCopyWithImpl<$Res>
    implements _$$_getDownloadsEventCopyWith<$Res> {
  __$$_getDownloadsEventCopyWithImpl(
      _$_getDownloadsEvent _value, $Res Function(_$_getDownloadsEvent) _then)
      : super(_value, (v) => _then(v as _$_getDownloadsEvent));

  @override
  _$_getDownloadsEvent get _value => super._value as _$_getDownloadsEvent;
}

/// @nodoc

class _$_getDownloadsEvent implements _getDownloadsEvent {
  const _$_getDownloadsEvent();

  @override
  String toString() {
    return 'DownloadsEvent.getDownloadsEvent()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_getDownloadsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getDownloadsEvent,
  }) {
    return getDownloadsEvent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getDownloadsEvent,
  }) {
    return getDownloadsEvent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getDownloadsEvent,
    required TResult orElse(),
  }) {
    if (getDownloadsEvent != null) {
      return getDownloadsEvent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_getDownloadsEvent value) getDownloadsEvent,
  }) {
    return getDownloadsEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_getDownloadsEvent value)? getDownloadsEvent,
  }) {
    return getDownloadsEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_getDownloadsEvent value)? getDownloadsEvent,
    required TResult orElse(),
  }) {
    if (getDownloadsEvent != null) {
      return getDownloadsEvent(this);
    }
    return orElse();
  }
}

abstract class _getDownloadsEvent implements DownloadsEvent {
  const factory _getDownloadsEvent() = _$_getDownloadsEvent;
}

/// @nodoc
mixin _$DownloadsState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Downloads> get downloads => throw _privateConstructorUsedError;
  Option<Either<MainFailure, List<Downloads>>>
      get downloadsFailuresOrSucessOptions =>
          throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DownloadsStateCopyWith<DownloadsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadsStateCopyWith<$Res> {
  factory $DownloadsStateCopyWith(
          DownloadsState value, $Res Function(DownloadsState) then) =
      _$DownloadsStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      List<Downloads> downloads,
      Option<Either<MainFailure, List<Downloads>>>
          downloadsFailuresOrSucessOptions});
}

/// @nodoc
class _$DownloadsStateCopyWithImpl<$Res>
    implements $DownloadsStateCopyWith<$Res> {
  _$DownloadsStateCopyWithImpl(this._value, this._then);

  final DownloadsState _value;
  // ignore: unused_field
  final $Res Function(DownloadsState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? downloads = freezed,
    Object? downloadsFailuresOrSucessOptions = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      downloads: downloads == freezed
          ? _value.downloads
          : downloads // ignore: cast_nullable_to_non_nullable
              as List<Downloads>,
      downloadsFailuresOrSucessOptions: downloadsFailuresOrSucessOptions ==
              freezed
          ? _value.downloadsFailuresOrSucessOptions
          : downloadsFailuresOrSucessOptions // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<Downloads>>>,
    ));
  }
}

/// @nodoc
abstract class _$$_DownloadsStateCopyWith<$Res>
    implements $DownloadsStateCopyWith<$Res> {
  factory _$$_DownloadsStateCopyWith(
          _$_DownloadsState value, $Res Function(_$_DownloadsState) then) =
      __$$_DownloadsStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      List<Downloads> downloads,
      Option<Either<MainFailure, List<Downloads>>>
          downloadsFailuresOrSucessOptions});
}

/// @nodoc
class __$$_DownloadsStateCopyWithImpl<$Res>
    extends _$DownloadsStateCopyWithImpl<$Res>
    implements _$$_DownloadsStateCopyWith<$Res> {
  __$$_DownloadsStateCopyWithImpl(
      _$_DownloadsState _value, $Res Function(_$_DownloadsState) _then)
      : super(_value, (v) => _then(v as _$_DownloadsState));

  @override
  _$_DownloadsState get _value => super._value as _$_DownloadsState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? downloads = freezed,
    Object? downloadsFailuresOrSucessOptions = freezed,
  }) {
    return _then(_$_DownloadsState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      downloads: downloads == freezed
          ? _value._downloads
          : downloads // ignore: cast_nullable_to_non_nullable
              as List<Downloads>,
      downloadsFailuresOrSucessOptions: downloadsFailuresOrSucessOptions ==
              freezed
          ? _value.downloadsFailuresOrSucessOptions
          : downloadsFailuresOrSucessOptions // ignore: cast_nullable_to_non_nullable
              as Option<Either<MainFailure, List<Downloads>>>,
    ));
  }
}

/// @nodoc

class _$_DownloadsState implements _DownloadsState {
  const _$_DownloadsState(
      {required this.isLoading,
      required final List<Downloads> downloads,
      required this.downloadsFailuresOrSucessOptions})
      : _downloads = downloads;

  @override
  final bool isLoading;
  final List<Downloads> _downloads;
  @override
  List<Downloads> get downloads {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_downloads);
  }

  @override
  final Option<Either<MainFailure, List<Downloads>>>
      downloadsFailuresOrSucessOptions;

  @override
  String toString() {
    return 'DownloadsState(isLoading: $isLoading, downloads: $downloads, downloadsFailuresOrSucessOptions: $downloadsFailuresOrSucessOptions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DownloadsState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other._downloads, _downloads) &&
            const DeepCollectionEquality().equals(
                other.downloadsFailuresOrSucessOptions,
                downloadsFailuresOrSucessOptions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(_downloads),
      const DeepCollectionEquality().hash(downloadsFailuresOrSucessOptions));

  @JsonKey(ignore: true)
  @override
  _$$_DownloadsStateCopyWith<_$_DownloadsState> get copyWith =>
      __$$_DownloadsStateCopyWithImpl<_$_DownloadsState>(this, _$identity);
}

abstract class _DownloadsState implements DownloadsState {
  const factory _DownloadsState(
      {required final bool isLoading,
      required final List<Downloads> downloads,
      required final Option<Either<MainFailure, List<Downloads>>>
          downloadsFailuresOrSucessOptions}) = _$_DownloadsState;

  @override
  bool get isLoading;
  @override
  List<Downloads> get downloads;
  @override
  Option<Either<MainFailure, List<Downloads>>>
      get downloadsFailuresOrSucessOptions;
  @override
  @JsonKey(ignore: true)
  _$$_DownloadsStateCopyWith<_$_DownloadsState> get copyWith =>
      throw _privateConstructorUsedError;
}
