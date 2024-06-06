// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return _Chat.fromJson(json);
}

/// @nodoc
mixin _$Chat {
  String get chatId => throw _privateConstructorUsedError;
  bool get isGroup => throw _privateConstructorUsedError;
  bool get isNjangiGroup => throw _privateConstructorUsedError;
  List<Message> get messages => throw _privateConstructorUsedError;
  List<Message> get sendingMessages => throw _privateConstructorUsedError;
  bool get isSending => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatCopyWith<Chat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCopyWith<$Res> {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) then) =
      _$ChatCopyWithImpl<$Res, Chat>;
  @useResult
  $Res call(
      {String chatId,
      bool isGroup,
      bool isNjangiGroup,
      List<Message> messages,
      List<Message> sendingMessages,
      bool isSending});
}

/// @nodoc
class _$ChatCopyWithImpl<$Res, $Val extends Chat>
    implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? isGroup = null,
    Object? isNjangiGroup = null,
    Object? messages = null,
    Object? sendingMessages = null,
    Object? isSending = null,
  }) {
    return _then(_value.copyWith(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      isGroup: null == isGroup
          ? _value.isGroup
          : isGroup // ignore: cast_nullable_to_non_nullable
              as bool,
      isNjangiGroup: null == isNjangiGroup
          ? _value.isNjangiGroup
          : isNjangiGroup // ignore: cast_nullable_to_non_nullable
              as bool,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      sendingMessages: null == sendingMessages
          ? _value.sendingMessages
          : sendingMessages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      isSending: null == isSending
          ? _value.isSending
          : isSending // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatImplCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$$ChatImplCopyWith(
          _$ChatImpl value, $Res Function(_$ChatImpl) then) =
      __$$ChatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String chatId,
      bool isGroup,
      bool isNjangiGroup,
      List<Message> messages,
      List<Message> sendingMessages,
      bool isSending});
}

/// @nodoc
class __$$ChatImplCopyWithImpl<$Res>
    extends _$ChatCopyWithImpl<$Res, _$ChatImpl>
    implements _$$ChatImplCopyWith<$Res> {
  __$$ChatImplCopyWithImpl(_$ChatImpl _value, $Res Function(_$ChatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? isGroup = null,
    Object? isNjangiGroup = null,
    Object? messages = null,
    Object? sendingMessages = null,
    Object? isSending = null,
  }) {
    return _then(_$ChatImpl(
      chatId: null == chatId
          ? _value.chatId
          : chatId // ignore: cast_nullable_to_non_nullable
              as String,
      isGroup: null == isGroup
          ? _value.isGroup
          : isGroup // ignore: cast_nullable_to_non_nullable
              as bool,
      isNjangiGroup: null == isNjangiGroup
          ? _value.isNjangiGroup
          : isNjangiGroup // ignore: cast_nullable_to_non_nullable
              as bool,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      sendingMessages: null == sendingMessages
          ? _value._sendingMessages
          : sendingMessages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
      isSending: null == isSending
          ? _value.isSending
          : isSending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatImpl extends _Chat {
  _$ChatImpl(
      {required this.chatId,
      required this.isGroup,
      required this.isNjangiGroup,
      final List<Message> messages = const [],
      final List<Message> sendingMessages = const [],
      this.isSending = false})
      : _messages = messages,
        _sendingMessages = sendingMessages,
        super._();

  factory _$ChatImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatImplFromJson(json);

  @override
  final String chatId;
  @override
  final bool isGroup;
  @override
  final bool isNjangiGroup;
  final List<Message> _messages;
  @override
  @JsonKey()
  List<Message> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  final List<Message> _sendingMessages;
  @override
  @JsonKey()
  List<Message> get sendingMessages {
    if (_sendingMessages is EqualUnmodifiableListView) return _sendingMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sendingMessages);
  }

  @override
  @JsonKey()
  final bool isSending;

  @override
  String toString() {
    return 'Chat(chatId: $chatId, isGroup: $isGroup, isNjangiGroup: $isNjangiGroup, messages: $messages, sendingMessages: $sendingMessages, isSending: $isSending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            (identical(other.isGroup, isGroup) || other.isGroup == isGroup) &&
            (identical(other.isNjangiGroup, isNjangiGroup) ||
                other.isNjangiGroup == isNjangiGroup) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            const DeepCollectionEquality()
                .equals(other._sendingMessages, _sendingMessages) &&
            (identical(other.isSending, isSending) ||
                other.isSending == isSending));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      chatId,
      isGroup,
      isNjangiGroup,
      const DeepCollectionEquality().hash(_messages),
      const DeepCollectionEquality().hash(_sendingMessages),
      isSending);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatImplCopyWith<_$ChatImpl> get copyWith =>
      __$$ChatImplCopyWithImpl<_$ChatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatImplToJson(
      this,
    );
  }
}

abstract class _Chat extends Chat {
  factory _Chat(
      {required final String chatId,
      required final bool isGroup,
      required final bool isNjangiGroup,
      final List<Message> messages,
      final List<Message> sendingMessages,
      final bool isSending}) = _$ChatImpl;
  _Chat._() : super._();

  factory _Chat.fromJson(Map<String, dynamic> json) = _$ChatImpl.fromJson;

  @override
  String get chatId;
  @override
  bool get isGroup;
  @override
  bool get isNjangiGroup;
  @override
  List<Message> get messages;
  @override
  List<Message> get sendingMessages;
  @override
  bool get isSending;
  @override
  @JsonKey(ignore: true)
  _$$ChatImplCopyWith<_$ChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
