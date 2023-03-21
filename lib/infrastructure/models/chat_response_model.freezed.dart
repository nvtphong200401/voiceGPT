// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatResponseModel _$ChatResponseModelFromJson(Map<String, dynamic> json) {
  return _ChatResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ChatResponseModel {
  String get id => throw _privateConstructorUsedError;
  String? get object => throw _privateConstructorUsedError;
  int? get created => throw _privateConstructorUsedError;
  UsageModel get usage => throw _privateConstructorUsedError;
  List<ChoiceModel> get choices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatResponseModelCopyWith<ChatResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatResponseModelCopyWith<$Res> {
  factory $ChatResponseModelCopyWith(
          ChatResponseModel value, $Res Function(ChatResponseModel) then) =
      _$ChatResponseModelCopyWithImpl<$Res, ChatResponseModel>;
  @useResult
  $Res call(
      {String id,
      String? object,
      int? created,
      UsageModel usage,
      List<ChoiceModel> choices});

  $UsageModelCopyWith<$Res> get usage;
}

/// @nodoc
class _$ChatResponseModelCopyWithImpl<$Res, $Val extends ChatResponseModel>
    implements $ChatResponseModelCopyWith<$Res> {
  _$ChatResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = freezed,
    Object? created = freezed,
    Object? usage = null,
    Object? choices = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: freezed == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int?,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as UsageModel,
      choices: null == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<ChoiceModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UsageModelCopyWith<$Res> get usage {
    return $UsageModelCopyWith<$Res>(_value.usage, (value) {
      return _then(_value.copyWith(usage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ChatResponseModelCopyWith<$Res>
    implements $ChatResponseModelCopyWith<$Res> {
  factory _$$_ChatResponseModelCopyWith(_$_ChatResponseModel value,
          $Res Function(_$_ChatResponseModel) then) =
      __$$_ChatResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? object,
      int? created,
      UsageModel usage,
      List<ChoiceModel> choices});

  @override
  $UsageModelCopyWith<$Res> get usage;
}

/// @nodoc
class __$$_ChatResponseModelCopyWithImpl<$Res>
    extends _$ChatResponseModelCopyWithImpl<$Res, _$_ChatResponseModel>
    implements _$$_ChatResponseModelCopyWith<$Res> {
  __$$_ChatResponseModelCopyWithImpl(
      _$_ChatResponseModel _value, $Res Function(_$_ChatResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? object = freezed,
    Object? created = freezed,
    Object? usage = null,
    Object? choices = null,
  }) {
    return _then(_$_ChatResponseModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      object: freezed == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int?,
      usage: null == usage
          ? _value.usage
          : usage // ignore: cast_nullable_to_non_nullable
              as UsageModel,
      choices: null == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<ChoiceModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatResponseModel extends _ChatResponseModel {
  const _$_ChatResponseModel(
      {required this.id,
      this.object,
      this.created,
      required this.usage,
      required final List<ChoiceModel> choices})
      : _choices = choices,
        super._();

  factory _$_ChatResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChatResponseModelFromJson(json);

  @override
  final String id;
  @override
  final String? object;
  @override
  final int? created;
  @override
  final UsageModel usage;
  final List<ChoiceModel> _choices;
  @override
  List<ChoiceModel> get choices {
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_choices);
  }

  @override
  String toString() {
    return 'ChatResponseModel(id: $id, object: $object, created: $created, usage: $usage, choices: $choices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatResponseModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.usage, usage) || other.usage == usage) &&
            const DeepCollectionEquality().equals(other._choices, _choices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, object, created, usage,
      const DeepCollectionEquality().hash(_choices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatResponseModelCopyWith<_$_ChatResponseModel> get copyWith =>
      __$$_ChatResponseModelCopyWithImpl<_$_ChatResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatResponseModelToJson(
      this,
    );
  }
}

abstract class _ChatResponseModel extends ChatResponseModel {
  const factory _ChatResponseModel(
      {required final String id,
      final String? object,
      final int? created,
      required final UsageModel usage,
      required final List<ChoiceModel> choices}) = _$_ChatResponseModel;
  const _ChatResponseModel._() : super._();

  factory _ChatResponseModel.fromJson(Map<String, dynamic> json) =
      _$_ChatResponseModel.fromJson;

  @override
  String get id;
  @override
  String? get object;
  @override
  int? get created;
  @override
  UsageModel get usage;
  @override
  List<ChoiceModel> get choices;
  @override
  @JsonKey(ignore: true)
  _$$_ChatResponseModelCopyWith<_$_ChatResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
