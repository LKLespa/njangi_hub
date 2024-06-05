// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  String get mid => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String? get chatId => throw _privateConstructorUsedError;
  String? get groupId => throw _privateConstructorUsedError;
  dynamic get content => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  AttachmentType get messageType => throw _privateConstructorUsedError;
  List<Attachment> get attachments => throw _privateConstructorUsedError;
  bool get readByEveryone => throw _privateConstructorUsedError;
  List<String> get readBy => throw _privateConstructorUsedError;
  String? get repliedToMessageId => throw _privateConstructorUsedError;
  Message? get repliedToMessage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {String mid,
      String senderId,
      String? chatId,
      String? groupId,
      dynamic content,
      DateTime timestamp,
      AttachmentType messageType,
      List<Attachment> attachments,
      bool readByEveryone,
      List<String> readBy,
      String? repliedToMessageId,
      Message? repliedToMessage});

  $MessageCopyWith<$Res>? get repliedToMessage;
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mid = null,
    Object? senderId = null,
    Object? chatId = freezed,
    Object? groupId = freezed,
    Object? content = freezed,
    Object? timestamp = null,
    Object? messageType = null,
    Object? attachments = null,
    Object? readByEveryone = null,
    Object? readBy = null,
    Object? repliedToMessageId = freezed,
    Object? repliedToMessage = freezed,
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
      chatId: freezed == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as dynamic,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as AttachmentType,
      attachments: null == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>,
      readByEveryone: null == readByEveryone
          ? _value.readByEveryone
          : readByEveryone // ignore: cast_nullable_to_non_nullable
              as bool,
      readBy: null == readBy
          ? _value.readBy
          : readBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      repliedToMessageId: freezed == repliedToMessageId
          ? _value.repliedToMessageId
          : repliedToMessageId // ignore: cast_nullable_to_non_nullable
              as String?,
      repliedToMessage: freezed == repliedToMessage
          ? _value.repliedToMessage
          : repliedToMessage // ignore: cast_nullable_to_non_nullable
              as Message?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MessageCopyWith<$Res>? get repliedToMessage {
    if (_value.repliedToMessage == null) {
      return null;
    }

    return $MessageCopyWith<$Res>(_value.repliedToMessage!, (value) {
      return _then(_value.copyWith(repliedToMessage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
          _$MessageImpl value, $Res Function(_$MessageImpl) then) =
      __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mid,
      String senderId,
      String? chatId,
      String? groupId,
      dynamic content,
      DateTime timestamp,
      AttachmentType messageType,
      List<Attachment> attachments,
      bool readByEveryone,
      List<String> readBy,
      String? repliedToMessageId,
      Message? repliedToMessage});

  @override
  $MessageCopyWith<$Res>? get repliedToMessage;
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
      _$MessageImpl _value, $Res Function(_$MessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mid = null,
    Object? senderId = null,
    Object? chatId = freezed,
    Object? groupId = freezed,
    Object? content = freezed,
    Object? timestamp = null,
    Object? messageType = null,
    Object? attachments = null,
    Object? readByEveryone = null,
    Object? readBy = null,
    Object? repliedToMessageId = freezed,
    Object? repliedToMessage = freezed,
  }) {
    return _then(_$MessageImpl(
      mid: null == mid
          ? _value.mid
          : mid // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _value.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      chatId: freezed == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String?,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as dynamic,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      messageType: null == messageType
          ? _value.messageType
          : messageType // ignore: cast_nullable_to_non_nullable
              as AttachmentType,
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<Attachment>,
      readByEveryone: null == readByEveryone
          ? _value.readByEveryone
          : readByEveryone // ignore: cast_nullable_to_non_nullable
              as bool,
      readBy: null == readBy
          ? _value._readBy
          : readBy // ignore: cast_nullable_to_non_nullable
              as List<String>,
      repliedToMessageId: freezed == repliedToMessageId
          ? _value.repliedToMessageId
          : repliedToMessageId // ignore: cast_nullable_to_non_nullable
              as String?,
      repliedToMessage: freezed == repliedToMessage
          ? _value.repliedToMessage
          : repliedToMessage // ignore: cast_nullable_to_non_nullable
              as Message?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl extends _Message {
  _$MessageImpl(
      {required this.mid,
      required this.senderId,
      this.chatId,
      this.groupId,
      required this.content,
      required this.timestamp,
      this.messageType = AttachmentType.text,
      final List<Attachment> attachments = const [],
      this.readByEveryone = false,
      final List<String> readBy = const [],
      this.repliedToMessageId,
      this.repliedToMessage})
      : _attachments = attachments,
        _readBy = readBy,
        super._();

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  final String mid;
  @override
  final String senderId;
  @override
  final String? chatId;
  @override
  final String? groupId;
  @override
  final dynamic content;
  @override
  final DateTime timestamp;
  @override
  @JsonKey()
  final AttachmentType messageType;
  final List<Attachment> _attachments;
  @override
  @JsonKey()
  List<Attachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  @JsonKey()
  final bool readByEveryone;
  final List<String> _readBy;
  @override
  @JsonKey()
  List<String> get readBy {
    if (_readBy is EqualUnmodifiableListView) return _readBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readBy);
  }

  @override
  final String? repliedToMessageId;
  @override
  final Message? repliedToMessage;

  @override
  String toString() {
    return 'Message(mid: $mid, senderId: $senderId, chatId: $chatId, groupId: $groupId, content: $content, timestamp: $timestamp, messageType: $messageType, attachments: $attachments, readByEveryone: $readByEveryone, readBy: $readBy, repliedToMessageId: $repliedToMessageId, repliedToMessage: $repliedToMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.mid, mid) || other.mid == mid) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            const DeepCollectionEquality().equals(other.content, content) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.messageType, messageType) ||
                other.messageType == messageType) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.readByEveryone, readByEveryone) ||
                other.readByEveryone == readByEveryone) &&
            const DeepCollectionEquality().equals(other._readBy, _readBy) &&
            (identical(other.repliedToMessageId, repliedToMessageId) ||
                other.repliedToMessageId == repliedToMessageId) &&
            (identical(other.repliedToMessage, repliedToMessage) ||
                other.repliedToMessage == repliedToMessage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      mid,
      senderId,
      chatId,
      groupId,
      const DeepCollectionEquality().hash(content),
      timestamp,
      messageType,
      const DeepCollectionEquality().hash(_attachments),
      readByEveryone,
      const DeepCollectionEquality().hash(_readBy),
      repliedToMessageId,
      repliedToMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(
      this,
    );
  }
}

abstract class _Message extends Message {
  factory _Message(
      {required final String mid,
      required final String senderId,
      final String? chatId,
      final String? groupId,
      required final dynamic content,
      required final DateTime timestamp,
      final AttachmentType messageType,
      final List<Attachment> attachments,
      final bool readByEveryone,
      final List<String> readBy,
      final String? repliedToMessageId,
      final Message? repliedToMessage}) = _$MessageImpl;
  _Message._() : super._();

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  String get mid;
  @override
  String get senderId;
  @override
  String? get chatId;
  @override
  String? get groupId;
  @override
  dynamic get content;
  @override
  DateTime get timestamp;
  @override
  AttachmentType get messageType;
  @override
  List<Attachment> get attachments;
  @override
  bool get readByEveryone;
  @override
  List<String> get readBy;
  @override
  String? get repliedToMessageId;
  @override
  Message? get repliedToMessage;
  @override
  @JsonKey(ignore: true)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
