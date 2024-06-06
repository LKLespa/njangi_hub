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
  final _uuid = const Uuid();

  @override
  Chat build(Chat chat) {
    _db.settings = const Settings(
        persistenceEnabled: true,
        cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
    return chat;
  }

  void addMessage(Message newMessage) {
    state = state.copyWith(messages: [...state.messages, newMessage]);
  }

  void updateMessages(List<Message> messages) {
    state = state.copyWith(messages: messages);
  }
  void deleteMessage(String messageId) {
    state = state.copyWith(
        messages: state.messages
            .where((message) => message.mid != messageId)
            .toList());
  }

  void updateMessage(Message updatedMessage) {
    state = state.copyWith(
        messages: state.messages
            .map((message) =>
                message.mid == updatedMessage.mid ? updatedMessage : message)
            .toList());
  }

  Future<void> sendMessageToFirestore(
      {String? text,
      String? chatId,
      String? groupId,
      String? filePath,
      required AttachmentType messageType,
      List<Attachment>? attachments,
      String? repliedToMessage}) async {
    final id = _uuid.v1();

    Message message = Message(
      mid: id,
      chatId: chatId,
      groupId: groupId,
      senderId: _auth.currentUser!.uid,
      text: text,
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
      addMessage(message);
      state = state.copyWith(sendingMessages: [...state.sendingMessages, message], isSending: true);
      print('Sending messages now is ${state.sendingMessages.length}');
      // check if the message is for a group or not
      if (state.isGroup) {
        chatRef = _db
            .collection(state.isNjangiGroup ? "njangi-groups" : "fund-groups")
            .doc(groupId ?? state.chatId);
      } else {
        chatRef = _db.collection("private-chats").doc(chatId ?? state.chatId);
      }

      // Upload the message to firestore and update the state
      List<Message> temp = state.sendingMessages.where((e) => e != message).toList();
      await chatRef.collection("messages").doc(message.mid).set(message.toExtendedJson()).then((_) {
        state = state.copyWith(sendingMessages: temp, isSending: false);
        chatRef.update({'lastMessage': message.toSimpleMessage().toExtendedJson()});
        updateMessage(message.copyWith(isSent: true));
      });
      print('Sending messages now is ${state.sendingMessages.length}');
    } catch (e) {
      print("Error: $e");
      toast(
          title: "An error occured",
          message: e.toString(),
          type: ToastificationType.error,
          alignment: Alignment.bottomCenter);
    }
  }
}
