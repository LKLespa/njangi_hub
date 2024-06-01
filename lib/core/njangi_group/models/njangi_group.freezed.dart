// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'njangi_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NjangiGroup _$NjangiGroupFromJson(Map<String, dynamic> json) {
  return _NjangiGroup.fromJson(json);
}

/// @nodoc
mixin _$NjangiGroup {
  String get gid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime? get dateCreated => throw _privateConstructorUsedError;
  List<String> get groupAdmins => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get groupMembers =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get groupInvites =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get groupRequests =>
      throw _privateConstructorUsedError;
  double get currentAmount => throw _privateConstructorUsedError;
  PaymentAccount? get paymentAccount => throw _privateConstructorUsedError;
  GroupChat get groupChat => throw _privateConstructorUsedError;
  NjangiGroupSettings get groupSettings => throw _privateConstructorUsedError;
  List<NjangiGroupCircle> get groupCircles =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NjangiGroupCopyWith<NjangiGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NjangiGroupCopyWith<$Res> {
  factory $NjangiGroupCopyWith(
          NjangiGroup value, $Res Function(NjangiGroup) then) =
      _$NjangiGroupCopyWithImpl<$Res, NjangiGroup>;
  @useResult
  $Res call(
      {String gid,
      String name,
      String? description,
      DateTime? dateCreated,
      List<String> groupAdmins,
      List<Map<String, dynamic>> groupMembers,
      List<Map<String, dynamic>> groupInvites,
      List<Map<String, dynamic>> groupRequests,
      double currentAmount,
      PaymentAccount? paymentAccount,
      GroupChat groupChat,
      NjangiGroupSettings groupSettings,
      List<NjangiGroupCircle> groupCircles});

  $PaymentAccountCopyWith<$Res>? get paymentAccount;
  $GroupChatCopyWith<$Res> get groupChat;
  $NjangiGroupSettingsCopyWith<$Res> get groupSettings;
}

/// @nodoc
class _$NjangiGroupCopyWithImpl<$Res, $Val extends NjangiGroup>
    implements $NjangiGroupCopyWith<$Res> {
  _$NjangiGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gid = null,
    Object? name = null,
    Object? description = freezed,
    Object? dateCreated = freezed,
    Object? groupAdmins = null,
    Object? groupMembers = null,
    Object? groupInvites = null,
    Object? groupRequests = null,
    Object? currentAmount = null,
    Object? paymentAccount = freezed,
    Object? groupChat = null,
    Object? groupSettings = null,
    Object? groupCircles = null,
  }) {
    return _then(_value.copyWith(
      gid: null == gid
          ? _value.gid
          : gid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCreated: freezed == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      groupAdmins: null == groupAdmins
          ? _value.groupAdmins
          : groupAdmins // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groupMembers: null == groupMembers
          ? _value.groupMembers
          : groupMembers // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      groupInvites: null == groupInvites
          ? _value.groupInvites
          : groupInvites // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      groupRequests: null == groupRequests
          ? _value.groupRequests
          : groupRequests // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      currentAmount: null == currentAmount
          ? _value.currentAmount
          : currentAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentAccount: freezed == paymentAccount
          ? _value.paymentAccount
          : paymentAccount // ignore: cast_nullable_to_non_nullable
              as PaymentAccount?,
      groupChat: null == groupChat
          ? _value.groupChat
          : groupChat // ignore: cast_nullable_to_non_nullable
              as GroupChat,
      groupSettings: null == groupSettings
          ? _value.groupSettings
          : groupSettings // ignore: cast_nullable_to_non_nullable
              as NjangiGroupSettings,
      groupCircles: null == groupCircles
          ? _value.groupCircles
          : groupCircles // ignore: cast_nullable_to_non_nullable
              as List<NjangiGroupCircle>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentAccountCopyWith<$Res>? get paymentAccount {
    if (_value.paymentAccount == null) {
      return null;
    }

    return $PaymentAccountCopyWith<$Res>(_value.paymentAccount!, (value) {
      return _then(_value.copyWith(paymentAccount: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GroupChatCopyWith<$Res> get groupChat {
    return $GroupChatCopyWith<$Res>(_value.groupChat, (value) {
      return _then(_value.copyWith(groupChat: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $NjangiGroupSettingsCopyWith<$Res> get groupSettings {
    return $NjangiGroupSettingsCopyWith<$Res>(_value.groupSettings, (value) {
      return _then(_value.copyWith(groupSettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NjangiGroupImplCopyWith<$Res>
    implements $NjangiGroupCopyWith<$Res> {
  factory _$$NjangiGroupImplCopyWith(
          _$NjangiGroupImpl value, $Res Function(_$NjangiGroupImpl) then) =
      __$$NjangiGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String gid,
      String name,
      String? description,
      DateTime? dateCreated,
      List<String> groupAdmins,
      List<Map<String, dynamic>> groupMembers,
      List<Map<String, dynamic>> groupInvites,
      List<Map<String, dynamic>> groupRequests,
      double currentAmount,
      PaymentAccount? paymentAccount,
      GroupChat groupChat,
      NjangiGroupSettings groupSettings,
      List<NjangiGroupCircle> groupCircles});

  @override
  $PaymentAccountCopyWith<$Res>? get paymentAccount;
  @override
  $GroupChatCopyWith<$Res> get groupChat;
  @override
  $NjangiGroupSettingsCopyWith<$Res> get groupSettings;
}

/// @nodoc
class __$$NjangiGroupImplCopyWithImpl<$Res>
    extends _$NjangiGroupCopyWithImpl<$Res, _$NjangiGroupImpl>
    implements _$$NjangiGroupImplCopyWith<$Res> {
  __$$NjangiGroupImplCopyWithImpl(
      _$NjangiGroupImpl _value, $Res Function(_$NjangiGroupImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gid = null,
    Object? name = null,
    Object? description = freezed,
    Object? dateCreated = freezed,
    Object? groupAdmins = null,
    Object? groupMembers = null,
    Object? groupInvites = null,
    Object? groupRequests = null,
    Object? currentAmount = null,
    Object? paymentAccount = freezed,
    Object? groupChat = null,
    Object? groupSettings = null,
    Object? groupCircles = null,
  }) {
    return _then(_$NjangiGroupImpl(
      gid: null == gid
          ? _value.gid
          : gid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dateCreated: freezed == dateCreated
          ? _value.dateCreated
          : dateCreated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      groupAdmins: null == groupAdmins
          ? _value._groupAdmins
          : groupAdmins // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groupMembers: null == groupMembers
          ? _value._groupMembers
          : groupMembers // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      groupInvites: null == groupInvites
          ? _value._groupInvites
          : groupInvites // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      groupRequests: null == groupRequests
          ? _value._groupRequests
          : groupRequests // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      currentAmount: null == currentAmount
          ? _value.currentAmount
          : currentAmount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentAccount: freezed == paymentAccount
          ? _value.paymentAccount
          : paymentAccount // ignore: cast_nullable_to_non_nullable
              as PaymentAccount?,
      groupChat: null == groupChat
          ? _value.groupChat
          : groupChat // ignore: cast_nullable_to_non_nullable
              as GroupChat,
      groupSettings: null == groupSettings
          ? _value.groupSettings
          : groupSettings // ignore: cast_nullable_to_non_nullable
              as NjangiGroupSettings,
      groupCircles: null == groupCircles
          ? _value._groupCircles
          : groupCircles // ignore: cast_nullable_to_non_nullable
              as List<NjangiGroupCircle>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NjangiGroupImpl implements _NjangiGroup {
  const _$NjangiGroupImpl(
      {required this.gid,
      required this.name,
      this.description,
      this.dateCreated,
      final List<String> groupAdmins = const [],
      final List<Map<String, dynamic>> groupMembers = const [],
      final List<Map<String, dynamic>> groupInvites = const [],
      final List<Map<String, dynamic>> groupRequests = const [],
      this.currentAmount = 0,
      this.paymentAccount,
      required this.groupChat,
      required this.groupSettings,
      final List<NjangiGroupCircle> groupCircles = const []})
      : _groupAdmins = groupAdmins,
        _groupMembers = groupMembers,
        _groupInvites = groupInvites,
        _groupRequests = groupRequests,
        _groupCircles = groupCircles;

  factory _$NjangiGroupImpl.fromJson(Map<String, dynamic> json) =>
      _$$NjangiGroupImplFromJson(json);

  @override
  final String gid;
  @override
  final String name;
  @override
  final String? description;
  @override
  final DateTime? dateCreated;
  final List<String> _groupAdmins;
  @override
  @JsonKey()
  List<String> get groupAdmins {
    if (_groupAdmins is EqualUnmodifiableListView) return _groupAdmins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groupAdmins);
  }

  final List<Map<String, dynamic>> _groupMembers;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get groupMembers {
    if (_groupMembers is EqualUnmodifiableListView) return _groupMembers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groupMembers);
  }

  final List<Map<String, dynamic>> _groupInvites;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get groupInvites {
    if (_groupInvites is EqualUnmodifiableListView) return _groupInvites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groupInvites);
  }

  final List<Map<String, dynamic>> _groupRequests;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get groupRequests {
    if (_groupRequests is EqualUnmodifiableListView) return _groupRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groupRequests);
  }

  @override
  @JsonKey()
  final double currentAmount;
  @override
  final PaymentAccount? paymentAccount;
  @override
  final GroupChat groupChat;
  @override
  final NjangiGroupSettings groupSettings;
  final List<NjangiGroupCircle> _groupCircles;
  @override
  @JsonKey()
  List<NjangiGroupCircle> get groupCircles {
    if (_groupCircles is EqualUnmodifiableListView) return _groupCircles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groupCircles);
  }

  @override
  String toString() {
    return 'NjangiGroup(gid: $gid, name: $name, description: $description, dateCreated: $dateCreated, groupAdmins: $groupAdmins, groupMembers: $groupMembers, groupInvites: $groupInvites, groupRequests: $groupRequests, currentAmount: $currentAmount, paymentAccount: $paymentAccount, groupChat: $groupChat, groupSettings: $groupSettings, groupCircles: $groupCircles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NjangiGroupImpl &&
            (identical(other.gid, gid) || other.gid == gid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dateCreated, dateCreated) ||
                other.dateCreated == dateCreated) &&
            const DeepCollectionEquality()
                .equals(other._groupAdmins, _groupAdmins) &&
            const DeepCollectionEquality()
                .equals(other._groupMembers, _groupMembers) &&
            const DeepCollectionEquality()
                .equals(other._groupInvites, _groupInvites) &&
            const DeepCollectionEquality()
                .equals(other._groupRequests, _groupRequests) &&
            (identical(other.currentAmount, currentAmount) ||
                other.currentAmount == currentAmount) &&
            (identical(other.paymentAccount, paymentAccount) ||
                other.paymentAccount == paymentAccount) &&
            (identical(other.groupChat, groupChat) ||
                other.groupChat == groupChat) &&
            (identical(other.groupSettings, groupSettings) ||
                other.groupSettings == groupSettings) &&
            const DeepCollectionEquality()
                .equals(other._groupCircles, _groupCircles));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      gid,
      name,
      description,
      dateCreated,
      const DeepCollectionEquality().hash(_groupAdmins),
      const DeepCollectionEquality().hash(_groupMembers),
      const DeepCollectionEquality().hash(_groupInvites),
      const DeepCollectionEquality().hash(_groupRequests),
      currentAmount,
      paymentAccount,
      groupChat,
      groupSettings,
      const DeepCollectionEquality().hash(_groupCircles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NjangiGroupImplCopyWith<_$NjangiGroupImpl> get copyWith =>
      __$$NjangiGroupImplCopyWithImpl<_$NjangiGroupImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NjangiGroupImplToJson(
      this,
    );
  }
}

abstract class _NjangiGroup implements NjangiGroup {
  const factory _NjangiGroup(
      {required final String gid,
      required final String name,
      final String? description,
      final DateTime? dateCreated,
      final List<String> groupAdmins,
      final List<Map<String, dynamic>> groupMembers,
      final List<Map<String, dynamic>> groupInvites,
      final List<Map<String, dynamic>> groupRequests,
      final double currentAmount,
      final PaymentAccount? paymentAccount,
      required final GroupChat groupChat,
      required final NjangiGroupSettings groupSettings,
      final List<NjangiGroupCircle> groupCircles}) = _$NjangiGroupImpl;

  factory _NjangiGroup.fromJson(Map<String, dynamic> json) =
      _$NjangiGroupImpl.fromJson;

  @override
  String get gid;
  @override
  String get name;
  @override
  String? get description;
  @override
  DateTime? get dateCreated;
  @override
  List<String> get groupAdmins;
  @override
  List<Map<String, dynamic>> get groupMembers;
  @override
  List<Map<String, dynamic>> get groupInvites;
  @override
  List<Map<String, dynamic>> get groupRequests;
  @override
  double get currentAmount;
  @override
  PaymentAccount? get paymentAccount;
  @override
  GroupChat get groupChat;
  @override
  NjangiGroupSettings get groupSettings;
  @override
  List<NjangiGroupCircle> get groupCircles;
  @override
  @JsonKey(ignore: true)
  _$$NjangiGroupImplCopyWith<_$NjangiGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
