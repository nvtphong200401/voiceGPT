// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usage_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UsageModel _$UsageModelFromJson(Map<String, dynamic> json) {
  return _UssageModel.fromJson(json);
}

/// @nodoc
mixin _$UsageModel {
  int get promptTokens => throw _privateConstructorUsedError;
  int get completionTokens => throw _privateConstructorUsedError;
  int get totalTokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsageModelCopyWith<UsageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsageModelCopyWith<$Res> {
  factory $UsageModelCopyWith(
          UsageModel value, $Res Function(UsageModel) then) =
      _$UsageModelCopyWithImpl<$Res, UsageModel>;
  @useResult
  $Res call({int promptTokens, int completionTokens, int totalTokens});
}

/// @nodoc
class _$UsageModelCopyWithImpl<$Res, $Val extends UsageModel>
    implements $UsageModelCopyWith<$Res> {
  _$UsageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promptTokens = null,
    Object? completionTokens = null,
    Object? totalTokens = null,
  }) {
    return _then(_value.copyWith(
      promptTokens: null == promptTokens
          ? _value.promptTokens
          : promptTokens // ignore: cast_nullable_to_non_nullable
              as int,
      completionTokens: null == completionTokens
          ? _value.completionTokens
          : completionTokens // ignore: cast_nullable_to_non_nullable
              as int,
      totalTokens: null == totalTokens
          ? _value.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UssageModelCopyWith<$Res>
    implements $UsageModelCopyWith<$Res> {
  factory _$$_UssageModelCopyWith(
          _$_UssageModel value, $Res Function(_$_UssageModel) then) =
      __$$_UssageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int promptTokens, int completionTokens, int totalTokens});
}

/// @nodoc
class __$$_UssageModelCopyWithImpl<$Res>
    extends _$UsageModelCopyWithImpl<$Res, _$_UssageModel>
    implements _$$_UssageModelCopyWith<$Res> {
  __$$_UssageModelCopyWithImpl(
      _$_UssageModel _value, $Res Function(_$_UssageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promptTokens = null,
    Object? completionTokens = null,
    Object? totalTokens = null,
  }) {
    return _then(_$_UssageModel(
      promptTokens: null == promptTokens
          ? _value.promptTokens
          : promptTokens // ignore: cast_nullable_to_non_nullable
              as int,
      completionTokens: null == completionTokens
          ? _value.completionTokens
          : completionTokens // ignore: cast_nullable_to_non_nullable
              as int,
      totalTokens: null == totalTokens
          ? _value.totalTokens
          : totalTokens // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UssageModel extends _UssageModel {
  const _$_UssageModel(
      {required this.promptTokens,
      required this.completionTokens,
      required this.totalTokens})
      : super._();

  factory _$_UssageModel.fromJson(Map<String, dynamic> json) =>
      _$$_UssageModelFromJson(json);

  @override
  final int promptTokens;
  @override
  final int completionTokens;
  @override
  final int totalTokens;

  @override
  String toString() {
    return 'UsageModel(promptTokens: $promptTokens, completionTokens: $completionTokens, totalTokens: $totalTokens)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UssageModel &&
            (identical(other.promptTokens, promptTokens) ||
                other.promptTokens == promptTokens) &&
            (identical(other.completionTokens, completionTokens) ||
                other.completionTokens == completionTokens) &&
            (identical(other.totalTokens, totalTokens) ||
                other.totalTokens == totalTokens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, promptTokens, completionTokens, totalTokens);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UssageModelCopyWith<_$_UssageModel> get copyWith =>
      __$$_UssageModelCopyWithImpl<_$_UssageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UssageModelToJson(
      this,
    );
  }
}

abstract class _UssageModel extends UsageModel {
  const factory _UssageModel(
      {required final int promptTokens,
      required final int completionTokens,
      required final int totalTokens}) = _$_UssageModel;
  const _UssageModel._() : super._();

  factory _UssageModel.fromJson(Map<String, dynamic> json) =
      _$_UssageModel.fromJson;

  @override
  int get promptTokens;
  @override
  int get completionTokens;
  @override
  int get totalTokens;
  @override
  @JsonKey(ignore: true)
  _$$_UssageModelCopyWith<_$_UssageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
