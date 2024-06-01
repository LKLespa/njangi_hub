// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get uid => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  String get aboutMe => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;
  DateTime? get lastSeen => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get groupsGIDs =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get groupRequestsGIDs =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get groupInvitesGIDs =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get privateChatsCIDs =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String uid,
      String? token,
      String? name,
      String? username,
      String? email,
      String? phone,
      String aboutMe,
      String? photo,
      bool isOnline,
      DateTime? lastSeen,
      DateTime? createdAt,
      List<Map<String, dynamic>> groupsGIDs,
      List<Map<String, dynamic>> groupRequestsGIDs,
      List<Map<String, dynamic>> groupInvitesGIDs,
      List<Map<String, dynamic>> privateChatsCIDs});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? token = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? aboutMe = null,
    Object? photo = freezed,
    Object? isOnline = null,
    Object? lastSeen = freezed,
    Object? createdAt = freezed,
    Object? groupsGIDs = null,
    Object? groupRequestsGIDs = null,
    Object? groupInvitesGIDs = null,
    Object? privateChatsCIDs = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      aboutMe: null == aboutMe
          ? _value.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as String,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      lastSeen: freezed == lastSeen
          ? _value.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      groupsGIDs: null == groupsGIDs
          ? _value.groupsGIDs
          : groupsGIDs // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      groupRequestsGIDs: null == groupRequestsGIDs
          ? _value.groupRequestsGIDs
          : groupRequestsGIDs // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      groupInvitesGIDs: null == groupInvitesGIDs
          ? _value.groupInvitesGIDs
          : groupInvitesGIDs // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      privateChatsCIDs: null == privateChatsCIDs
          ? _value.privateChatsCIDs
          : privateChatsCIDs // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String? token,
      String? name,
      String? username,
      String? email,
      String? phone,
      String aboutMe,
      String? photo,
      bool isOnline,
      DateTime? lastSeen,
      DateTime? createdAt,
      List<Map<String, dynamic>> groupsGIDs,
      List<Map<String, dynamic>> groupRequestsGIDs,
      List<Map<String, dynamic>> groupInvitesGIDs,
      List<Map<String, dynamic>> privateChatsCIDs});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? token = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? aboutMe = null,
    Object? photo = freezed,
    Object? isOnline = null,
    Object? lastSeen = freezed,
    Object? createdAt = freezed,
    Object? groupsGIDs = null,
    Object? groupRequestsGIDs = null,
    Object? groupInvitesGIDs = null,
    Object? privateChatsCIDs = null,
  }) {
    return _then(_$UserImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      aboutMe: null == aboutMe
          ? _value.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as String,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
      lastSeen: freezed == lastSeen
          ? _value.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      groupsGIDs: null == groupsGIDs
          ? _value._groupsGIDs
          : groupsGIDs // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      groupRequestsGIDs: null == groupRequestsGIDs
          ? _value._groupRequestsGIDs
          : groupRequestsGIDs // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      groupInvitesGIDs: null == groupInvitesGIDs
          ? _value._groupInvitesGIDs
          : groupInvitesGIDs // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      privateChatsCIDs: null == privateChatsCIDs
          ? _value._privateChatsCIDs
          : privateChatsCIDs // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl extends _User {
  _$UserImpl(
      {required this.uid,
      this.token,
      this.name,
      this.username,
      this.email,
      this.phone,
      this.aboutMe = '',
      this.photo,
      this.isOnline = false,
      this.lastSeen,
      this.createdAt,
      final List<Map<String, dynamic>> groupsGIDs = const [],
      final List<Map<String, dynamic>> groupRequestsGIDs = const [],
      final List<Map<String, dynamic>> groupInvitesGIDs = const [],
      final List<Map<String, dynamic>> privateChatsCIDs = const []})
      : _groupsGIDs = groupsGIDs,
        _groupRequestsGIDs = groupRequestsGIDs,
        _groupInvitesGIDs = groupInvitesGIDs,
        _privateChatsCIDs = privateChatsCIDs,
        super._();

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String uid;
  @override
  final String? token;
  @override
  final String? name;
  @override
  final String? username;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  @JsonKey()
  final String aboutMe;
  @override
  final String? photo;
  @override
  @JsonKey()
  final bool isOnline;
  @override
  final DateTime? lastSeen;
  @override
  final DateTime? createdAt;
  final List<Map<String, dynamic>> _groupsGIDs;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get groupsGIDs {
    if (_groupsGIDs is EqualUnmodifiableListView) return _groupsGIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groupsGIDs);
  }

  final List<Map<String, dynamic>> _groupRequestsGIDs;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get groupRequestsGIDs {
    if (_groupRequestsGIDs is EqualUnmodifiableListView)
      return _groupRequestsGIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groupRequestsGIDs);
  }

  final List<Map<String, dynamic>> _groupInvitesGIDs;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get groupInvitesGIDs {
    if (_groupInvitesGIDs is EqualUnmodifiableListView)
      return _groupInvitesGIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groupInvitesGIDs);
  }

  final List<Map<String, dynamic>> _privateChatsCIDs;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get privateChatsCIDs {
    if (_privateChatsCIDs is EqualUnmodifiableListView)
      return _privateChatsCIDs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_privateChatsCIDs);
  }

  @override
  String toString() {
    return 'User(uid: $uid, token: $token, name: $name, username: $username, email: $email, phone: $phone, aboutMe: $aboutMe, photo: $photo, isOnline: $isOnline, lastSeen: $lastSeen, createdAt: $createdAt, groupsGIDs: $groupsGIDs, groupRequestsGIDs: $groupRequestsGIDs, groupInvitesGIDs: $groupInvitesGIDs, privateChatsCIDs: $privateChatsCIDs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._groupsGIDs, _groupsGIDs) &&
            const DeepCollectionEquality()
                .equals(other._groupRequestsGIDs, _groupRequestsGIDs) &&
            const DeepCollectionEquality()
                .equals(other._groupInvitesGIDs, _groupInvitesGIDs) &&
            const DeepCollectionEquality()
                .equals(other._privateChatsCIDs, _privateChatsCIDs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      token,
      name,
      username,
      email,
      phone,
      aboutMe,
      photo,
      isOnline,
      lastSeen,
      createdAt,
      const DeepCollectionEquality().hash(_groupsGIDs),
      const DeepCollectionEquality().hash(_groupRequestsGIDs),
      const DeepCollectionEquality().hash(_groupInvitesGIDs),
      const DeepCollectionEquality().hash(_privateChatsCIDs));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User extends User {
  factory _User(
      {required final String uid,
      final String? token,
      final String? name,
      final String? username,
      final String? email,
      final String? phone,
      final String aboutMe,
      final String? photo,
      final bool isOnline,
      final DateTime? lastSeen,
      final DateTime? createdAt,
      final List<Map<String, dynamic>> groupsGIDs,
      final List<Map<String, dynamic>> groupRequestsGIDs,
      final List<Map<String, dynamic>> groupInvitesGIDs,
      final List<Map<String, dynamic>> privateChatsCIDs}) = _$UserImpl;
  _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get uid;
  @override
  String? get token;
  @override
  String? get name;
  @override
  String? get username;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  String get aboutMe;
  @override
  String? get photo;
  @override
  bool get isOnline;
  @override
  DateTime? get lastSeen;
  @override
  DateTime? get createdAt;
  @override
  List<Map<String, dynamic>> get groupsGIDs;
  @override
  List<Map<String, dynamic>> get groupRequestsGIDs;
  @override
  List<Map<String, dynamic>> get groupInvitesGIDs;
  @override
  List<Map<String, dynamic>> get privateChatsCIDs;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
