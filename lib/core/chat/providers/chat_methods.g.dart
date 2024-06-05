// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_methods.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatMethodsHash() => r'9973ca87447118df8e8be085951c15ed25f34351';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ChatMethods extends BuildlessAutoDisposeNotifier<Chat> {
  late final dynamic chatId;
  late final bool isGroup;
  late final bool isNjangiGroup;
  late final List<Message> messages;

  Chat build({
    required dynamic chatId,
    required bool isGroup,
    required bool isNjangiGroup,
    List<Message> messages = const [],
  });
}

/// See also [ChatMethods].
@ProviderFor(ChatMethods)
const chatMethodsProvider = ChatMethodsFamily();

/// See also [ChatMethods].
class ChatMethodsFamily extends Family<Chat> {
  /// See also [ChatMethods].
  const ChatMethodsFamily();

  /// See also [ChatMethods].
  ChatMethodsProvider call({
    required dynamic chatId,
    required bool isGroup,
    required bool isNjangiGroup,
    List<Message> messages = const [],
  }) {
    return ChatMethodsProvider(
      chatId: chatId,
      isGroup: isGroup,
      isNjangiGroup: isNjangiGroup,
      messages: messages,
    );
  }

  @override
  ChatMethodsProvider getProviderOverride(
    covariant ChatMethodsProvider provider,
  ) {
    return call(
      chatId: provider.chatId,
      isGroup: provider.isGroup,
      isNjangiGroup: provider.isNjangiGroup,
      messages: provider.messages,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chatMethodsProvider';
}

/// See also [ChatMethods].
class ChatMethodsProvider
    extends AutoDisposeNotifierProviderImpl<ChatMethods, Chat> {
  /// See also [ChatMethods].
  ChatMethodsProvider({
    required dynamic chatId,
    required bool isGroup,
    required bool isNjangiGroup,
    List<Message> messages = const [],
  }) : this._internal(
          () => ChatMethods()
            ..chatId = chatId
            ..isGroup = isGroup
            ..isNjangiGroup = isNjangiGroup
            ..messages = messages,
          from: chatMethodsProvider,
          name: r'chatMethodsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatMethodsHash,
          dependencies: ChatMethodsFamily._dependencies,
          allTransitiveDependencies:
              ChatMethodsFamily._allTransitiveDependencies,
          chatId: chatId,
          isGroup: isGroup,
          isNjangiGroup: isNjangiGroup,
          messages: messages,
        );

  ChatMethodsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chatId,
    required this.isGroup,
    required this.isNjangiGroup,
    required this.messages,
  }) : super.internal();

  final dynamic chatId;
  final bool isGroup;
  final bool isNjangiGroup;
  final List<Message> messages;

  @override
  Chat runNotifierBuild(
    covariant ChatMethods notifier,
  ) {
    return notifier.build(
      chatId: chatId,
      isGroup: isGroup,
      isNjangiGroup: isNjangiGroup,
      messages: messages,
    );
  }

  @override
  Override overrideWith(ChatMethods Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChatMethodsProvider._internal(
        () => create()
          ..chatId = chatId
          ..isGroup = isGroup
          ..isNjangiGroup = isNjangiGroup
          ..messages = messages,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chatId: chatId,
        isGroup: isGroup,
        isNjangiGroup: isNjangiGroup,
        messages: messages,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ChatMethods, Chat> createElement() {
    return _ChatMethodsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatMethodsProvider &&
        other.chatId == chatId &&
        other.isGroup == isGroup &&
        other.isNjangiGroup == isNjangiGroup &&
        other.messages == messages;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chatId.hashCode);
    hash = _SystemHash.combine(hash, isGroup.hashCode);
    hash = _SystemHash.combine(hash, isNjangiGroup.hashCode);
    hash = _SystemHash.combine(hash, messages.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChatMethodsRef on AutoDisposeNotifierProviderRef<Chat> {
  /// The parameter `chatId` of this provider.
  dynamic get chatId;

  /// The parameter `isGroup` of this provider.
  bool get isGroup;

  /// The parameter `isNjangiGroup` of this provider.
  bool get isNjangiGroup;

  /// The parameter `messages` of this provider.
  List<Message> get messages;
}

class _ChatMethodsProviderElement
    extends AutoDisposeNotifierProviderElement<ChatMethods, Chat>
    with ChatMethodsRef {
  _ChatMethodsProviderElement(super.provider);

  @override
  dynamic get chatId => (origin as ChatMethodsProvider).chatId;
  @override
  bool get isGroup => (origin as ChatMethodsProvider).isGroup;
  @override
  bool get isNjangiGroup => (origin as ChatMethodsProvider).isNjangiGroup;
  @override
  List<Message> get messages => (origin as ChatMethodsProvider).messages;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
