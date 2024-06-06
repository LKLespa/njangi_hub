// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'simple_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SimpleMessage _$SimpleMessageFromJson(Map<String, dynamic> json) {
  return _SimpleMessage.fromJson(json);
}

/// @nodoc
mixin _$SimpleMessage {
  String get mid => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  AttachmentType get messageType => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SimpleMessageCopyWith<SimpleMessage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleMessageCopyWith<$Res> {
  factory $SimpleMessageCopyWith(
          SimpleMessage value, $Res Function(SimpleMessage) then) =
      _$SimpleMessageCopyWithImpl<$Res, SimpleMessage>;
  @useResult
  $Res call(
      {String mid,
      String senderId,
      String? message,
      AttachmentType messageType,
      DateTime timestamp});
}

/// @nodoc
class _$SimpleMessageCopyWithImpl<$Res, $Val extends SimpleMessage>
    implements $SimpleMessageCopyWith<$Res> {
  _$SimpleMessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mid = null,
    Object? senderId = null,
    Object? message = freezed,
    Object? messageType = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      mid: null == mid
          ? _value.mid
          : mid // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as AttachmentType,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SimpleMessageImplCopyWith<$Res>
    implements $SimpleMessageCopyWith<$Res> {
  factory _$$SimpleMessageImplCopyWith(
          _$SimpleMessageImpl value, $Res Function(_$SimpleMessageImpl) then) =
      __$$SimpleMessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mid,
      String senderId,
      String? message,
      AttachmentType messageType,
      DateTime timestamp});
}

/// @nodoc
class __$$SimpleMessageImplCopyWithImpl<$Res>
    extends _$SimpleMessageCopyWithImpl<$Res, _$SimpleMessageImpl>
    implements _$$SimpleMessageImplCopyWith<$Res> {
  __$$SimpleMessageImplCopyWithImpl(
      _$SimpleMessageImpl _value, $Res Function(_$SimpleMessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mid = null,
    Object? senderId = null,
    Object? message = freezed,
    Object? messageType = null,
    Object? timestamp = null,
  }) {
    return _then(_$SimpleMessageImpl(
      mid: null == mid
          ? _value.mid
          : mid // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as AttachmentType,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SimpleMessageImpl extends _SimpleMessage {
  const _$SimpleMessageImpl(
      {required this.mid,
      required this.senderId,
      this.message,
      required this.messageType,
      required this.timestamp})
      : super._();

  factory _$SimpleMessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SimpleMessageImplFromJson(json);

  @override
  final String mid;
  @override
  final String senderId;
  @override
  final String? message;
  @override
  final AttachmentType messageType;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'SimpleMessage(mid: $mid, senderId: $senderId, message: $message, messageType: $messageType, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SimpleMessageImpl &&
            (identical(other.mid, mid) || other.mid == mid) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, mid, senderId, message, messageType, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SimpleMessageImplCopyWith<_$SimpleMessageImpl> get copyWith =>
      __$$SimpleMessageImplCopyWithImpl<_$SimpleMessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SimpleMessageImplToJson(
      this,
    );
  }
}

abstract class _SimpleMessage extends SimpleMessage {
  const factory _SimpleMessage(
      {required final String mid,
      required final String senderId,
      final String? message,
      required final AttachmentType messageType,
      required final DateTime timestamp}) = _$SimpleMessageImpl;
  const _SimpleMessage._() : super._();

  factory _SimpleMessage.fromJson(Map<String, dynamic> json) =
      _$SimpleMessageImpl.fromJson;

  @override
  String get mid;
  @override
  String get senderId;
  @override
  String? get message;
  @override
  AttachmentType get messageType;
  @override
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$SimpleMessageImplCopyWith<_$SimpleMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
