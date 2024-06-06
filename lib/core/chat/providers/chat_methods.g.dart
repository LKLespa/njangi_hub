// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_methods.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatMethodsHash() => r'61bebac1fb18daf84d8d579b660d1fd96a8a5b55';

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
  late final Chat chat;

  Chat build(
    Chat chat,
  );
}

/// See also [ChatMethods].
@ProviderFor(ChatMethods)
const chatMethodsProvider = ChatMethodsFamily();

/// See also [ChatMethods].
class ChatMethodsFamily extends Family<Chat> {
  /// See also [ChatMethods].
  const ChatMethodsFamily();

  /// See also [ChatMethods].
  ChatMethodsProvider call(
    Chat chat,
  ) {
    return ChatMethodsProvider(
      chat,
    );
  }

  @override
  ChatMethodsProvider getProviderOverride(
    covariant ChatMethodsProvider provider,
  ) {
    return call(
      provider.chat,
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
  ChatMethodsProvider(
    Chat chat,
  ) : this._internal(
          () => ChatMethods()..chat = chat,
          from: chatMethodsProvider,
          name: r'chatMethodsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatMethodsHash,
          dependencies: ChatMethodsFamily._dependencies,
          allTransitiveDependencies:
              ChatMethodsFamily._allTransitiveDependencies,
          chat: chat,
        );

  ChatMethodsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chat,
  }) : super.internal();

  final Chat chat;

  @override
  Chat runNotifierBuild(
    covariant ChatMethods notifier,
  ) {
    return notifier.build(
      chat,
    );
  }

  @override
  Override overrideWith(ChatMethods Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChatMethodsProvider._internal(
        () => create()..chat = chat,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chat: chat,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ChatMethods, Chat> createElement() {
    return _ChatMethodsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatMethodsProvider && other.chat == chat;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chat.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ChatMethodsRef on AutoDisposeNotifierProviderRef<Chat> {
  /// The parameter `chat` of this provider.
  Chat get chat;
}

class _ChatMethodsProviderElement
    extends AutoDisposeNotifierProviderElement<ChatMethods, Chat>
    with ChatMethodsRef {
  _ChatMethodsProviderElement(super.provider);

  @override
  Chat get chat => (origin as ChatMethodsProvider).chat;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
