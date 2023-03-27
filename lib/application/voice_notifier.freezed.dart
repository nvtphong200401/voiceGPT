// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VoiceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() stop,
    required TResult Function(String data) listening,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? stop,
    TResult? Function(String data)? listening,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? stop,
    TResult Function(String data)? listening,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VoiceStop value) stop,
    required TResult Function(VoiceListening value) listening,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VoiceStop value)? stop,
    TResult? Function(VoiceListening value)? listening,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VoiceStop value)? stop,
    TResult Function(VoiceListening value)? listening,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceStateCopyWith<$Res> {
  factory $VoiceStateCopyWith(
          VoiceState value, $Res Function(VoiceState) then) =
      _$VoiceStateCopyWithImpl<$Res, VoiceState>;
}

/// @nodoc
class _$VoiceStateCopyWithImpl<$Res, $Val extends VoiceState>
    implements $VoiceStateCopyWith<$Res> {
  _$VoiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$VoiceStopCopyWith<$Res> {
  factory _$$VoiceStopCopyWith(
          _$VoiceStop value, $Res Function(_$VoiceStop) then) =
      __$$VoiceStopCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VoiceStopCopyWithImpl<$Res>
    extends _$VoiceStateCopyWithImpl<$Res, _$VoiceStop>
    implements _$$VoiceStopCopyWith<$Res> {
  __$$VoiceStopCopyWithImpl(
      _$VoiceStop _value, $Res Function(_$VoiceStop) _then)
      : super(_value, _then);
}

/// @nodoc

class _$VoiceStop extends VoiceStop {
  const _$VoiceStop() : super._();

  @override
  String toString() {
    return 'VoiceState.stop()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VoiceStop);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() stop,
    required TResult Function(String data) listening,
  }) {
    return stop();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? stop,
    TResult? Function(String data)? listening,
  }) {
    return stop?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? stop,
    TResult Function(String data)? listening,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VoiceStop value) stop,
    required TResult Function(VoiceListening value) listening,
  }) {
    return stop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VoiceStop value)? stop,
    TResult? Function(VoiceListening value)? listening,
  }) {
    return stop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VoiceStop value)? stop,
    TResult Function(VoiceListening value)? listening,
    required TResult orElse(),
  }) {
    if (stop != null) {
      return stop(this);
    }
    return orElse();
  }
}

abstract class VoiceStop extends VoiceState {
  const factory VoiceStop() = _$VoiceStop;
  const VoiceStop._() : super._();
}

/// @nodoc
abstract class _$$VoiceListeningCopyWith<$Res> {
  factory _$$VoiceListeningCopyWith(
          _$VoiceListening value, $Res Function(_$VoiceListening) then) =
      __$$VoiceListeningCopyWithImpl<$Res>;
  @useResult
  $Res call({String data});
}

/// @nodoc
class __$$VoiceListeningCopyWithImpl<$Res>
    extends _$VoiceStateCopyWithImpl<$Res, _$VoiceListening>
    implements _$$VoiceListeningCopyWith<$Res> {
  __$$VoiceListeningCopyWithImpl(
      _$VoiceListening _value, $Res Function(_$VoiceListening) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$VoiceListening(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VoiceListening extends VoiceListening {
  const _$VoiceListening(this.data) : super._();

  @override
  final String data;

  @override
  String toString() {
    return 'VoiceState.listening(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoiceListening &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VoiceListeningCopyWith<_$VoiceListening> get copyWith =>
      __$$VoiceListeningCopyWithImpl<_$VoiceListening>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() stop,
    required TResult Function(String data) listening,
  }) {
    return listening(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? stop,
    TResult? Function(String data)? listening,
  }) {
    return listening?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? stop,
    TResult Function(String data)? listening,
    required TResult orElse(),
  }) {
    if (listening != null) {
      return listening(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(VoiceStop value) stop,
    required TResult Function(VoiceListening value) listening,
  }) {
    return listening(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(VoiceStop value)? stop,
    TResult? Function(VoiceListening value)? listening,
  }) {
    return listening?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(VoiceStop value)? stop,
    TResult Function(VoiceListening value)? listening,
    required TResult orElse(),
  }) {
    if (listening != null) {
      return listening(this);
    }
    return orElse();
  }
}

abstract class VoiceListening extends VoiceState {
  const factory VoiceListening(final String data) = _$VoiceListening;
  const VoiceListening._() : super._();

  String get data;
  @JsonKey(ignore: true)
  _$$VoiceListeningCopyWith<_$VoiceListening> get copyWith =>
      throw _privateConstructorUsedError;
}
