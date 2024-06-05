import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:njangi_hub/core/chat/chat.dart';
import 'package:njangi_hub/core/chat/models/chat.dart';
import 'package:njangi_hub/shared/shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:toastification/toastification.dart';
import 'package:uuid/uuid.dart';

part 'chat_methods.g.dart';

@riverpod
class ChatMethods extends _$ChatMethods {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final uuid = const Uuid();

  @override
  Chat build(
      {required chatId,
      required bool isGroup,
      required bool isNjangiGroup,
      List<Message> messages = const []}) {
    _db.settings = const Settings(
        persistenceEnabled: true,
        cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
    return Chat(
      chatId: chatId,
      isGroup: isGroup,
      messages: messages,
      isNjangiGroup: isNjangiGroup,
    );
  }

  Future<void> sendMessage(
      {required dynamic content,
      String? chatId,
      String? groupId,
      required AttachmentType messageType,
      List<Attachment>? attachments,
      String? repliedToMessage}) async {
    final id = uuid.v1();

    Message message = Message(
      mid: id,
      chatId: chatId,
      groupId: groupId,
      senderId: _auth.currentUser!.uid,
      content: content,
      timestamp: DateTime.now(),
      attachments: attachments ?? [],
      readBy: [],
      readByEveryone: false,
      repliedToMessageId: repliedToMessage,
      messageType: messageType,
    );

    if (chatId == null && groupId == null) {
      return;
    }

    try {
      DocumentReference chatRef;

      // check if the message is for a group or not
      if (state.isGroup) {
        chatRef = _db
            .collection(state.isNjangiGroup ? "njangi-groups" : "fund-groups")
            .doc(groupId ?? state.chatId);
      } else {
        chatRef = _db
            .collection("private-chats")
            .doc(chatId ?? state.chatId);
      }

      // check if its this message is replying to another message and get the replying to message
      if (message.repliedToMessageId != null) {
        final DocumentSnapshot baseMessageSnapshot =
            await chatRef.collection("messages").doc(message.repliedToMessageId).get();

        if (baseMessageSnapshot.exists) {
          final baseMessage = Message.fromJson(
              baseMessageSnapshot.data() as Map<String, dynamic>);
          message = message.copyWith(repliedToMessage: baseMessage);
        }
      }

      // Upload the message to firestore and update the state
      await chatRef.collection("messages").doc(message.mid).set(message.toJson()).then((_) {
        state = state.copyWith(messages: [...state.messages, message]);
        chatRef.update({'lastMessage': message.toJson()});
      });

      print('Message is $message');
      print("State is $state");
    } catch (e) {
      toast(
          title: "An error occured",
          message: e.toString(),
          type: ToastificationType.error,
          alignment: Alignment.bottomCenter);
    }
  }
}
