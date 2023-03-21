// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'choice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChoiceModel _$ChoiceModelFromJson(Map<String, dynamic> json) {
  return _ChoiceModel.fromJson(json);
}

/// @nodoc
mixin _$ChoiceModel {
  int? get index => throw _privateConstructorUsedError;
  MessageModel get message => throw _privateConstructorUsedError;
  String get finishReason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChoiceModelCopyWith<ChoiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChoiceModelCopyWith<$Res> {
  factory $ChoiceModelCopyWith(
          ChoiceModel value, $Res Function(ChoiceModel) then) =
      _$ChoiceModelCopyWithImpl<$Res, ChoiceModel>;
  @useResult
  $Res call({int? index, MessageModel message, String finishReason});

  $MessageModelCopyWith<$Res> get message;
}

/// @nodoc
class _$ChoiceModelCopyWithImpl<$Res, $Val extends ChoiceModel>
    implements $ChoiceModelCopyWith<$Res> {
  _$ChoiceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? message = null,
    Object? finishReason = null,
  }) {
    return _then(_value.copyWith(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as MessageModel,
      finishReason: null == finishReason
          ? _value.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageModelCopyWith<$Res> get message {
    return $MessageModelCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChoiceModelCopyWith<$Res>
    implements $ChoiceModelCopyWith<$Res> {
  factory _$$_ChoiceModelCopyWith(
          _$_ChoiceModel value, $Res Function(_$_ChoiceModel) then) =
      __$$_ChoiceModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? index, MessageModel message, String finishReason});

  @override
  $MessageModelCopyWith<$Res> get message;
}

/// @nodoc
class __$$_ChoiceModelCopyWithImpl<$Res>
    extends _$ChoiceModelCopyWithImpl<$Res, _$_ChoiceModel>
    implements _$$_ChoiceModelCopyWith<$Res> {
  __$$_ChoiceModelCopyWithImpl(
      _$_ChoiceModel _value, $Res Function(_$_ChoiceModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? message = null,
    Object? finishReason = null,
  }) {
    return _then(_$_ChoiceModel(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as MessageModel,
      finishReason: null == finishReason
          ? _value.finishReason
          : finishReason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_ChoiceModel extends _ChoiceModel {
  const _$_ChoiceModel(
      {this.index, required this.message, required this.finishReason})
      : super._();

  factory _$_ChoiceModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChoiceModelFromJson(json);

  @override
  final int? index;
  @override
  final MessageModel message;
  @override
  final String finishReason;

  @override
  String toString() {
    return 'ChoiceModel(index: $index, message: $message, finishReason: $finishReason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChoiceModel &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.finishReason, finishReason) ||
                other.finishReason == finishReason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, index, message, finishReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChoiceModelCopyWith<_$_ChoiceModel> get copyWith =>
      __$$_ChoiceModelCopyWithImpl<_$_ChoiceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChoiceModelToJson(
      this,
    );
  }
}

abstract class _ChoiceModel extends ChoiceModel {
  const factory _ChoiceModel(
      {final int? index,
      required final MessageModel message,
      required final String finishReason}) = _$_ChoiceModel;
  const _ChoiceModel._() : super._();

  factory _ChoiceModel.fromJson(Map<String, dynamic> json) =
      _$_ChoiceModel.fromJson;

  @override
  int? get index;
  @override
  MessageModel get message;
  @override
  String get finishReason;
  @override
  @JsonKey(ignore: true)
  _$$_ChoiceModelCopyWith<_$_ChoiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
