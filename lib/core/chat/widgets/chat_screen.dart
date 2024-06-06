import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:njangi_hub/core/chat/chat.dart';
import 'package:njangi_hub/core/njangi_group/njangi_groups.dart';
import 'package:njangi_hub/shared/shared.dart';

class ChatScreen extends StatefulHookConsumerWidget {
  const ChatScreen(
      {required this.chatId,
      required this.isGroup,
      required this.isNjangiGroup,
      super.key});

  final String chatId;
  final bool isGroup;
  final bool isNjangiGroup;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  late Chat chat;

  @override
  void initState() {
    super.initState();
    chat = Chat(
        isNjangiGroup: widget.isNjangiGroup,
        isGroup: widget.isGroup,
        chatId: widget.chatId,
        messages: []);
  }

  final FirebaseFirestore _db = FirebaseFirestore.instance
    ..settings = const Settings(
        persistenceEnabled: true,
        cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);

  List<Message> temp = [];

  @override
  Widget build(BuildContext context) {
    final chatProvider = ref.watch(chatMethodsProvider(chat));
    final Stream<QuerySnapshot<Map<String, dynamic>>> messagesStream = _db
        .collection("njangi-groups")
        .doc(widget.chatId)
        .collection('messages')
        .orderBy("timestamp", descending: false)
        .snapshots();

    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: messagesStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return DisplayErrorWidget(error: snapshot.error as Exception);
          }

          List<Message> messages = [];
          if (snapshot.hasData) {
            for (final doc in snapshot.data!.docs) {
              final message = Message.fromExtendedJson(doc.data());
              messages.add(message);
            }
          }
          chat = chat.copyWith(messages: messages);
          if(!chatProvider.isSending){
            temp = messages;
          }
          final allMessages = [...temp, ...chatProvider.sendingMessages];
          print("Messages: ${messages.length}");
          print("Sending messages: ${chatProvider.sendingMessages.length}");
          print("Allmessages: ${allMessages.length}");
          return Column(
            // alignment: Alignment.bottomCenter,
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: allMessages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final message = allMessages[index];
                      return Card(
                          elevation: 0.5,
                          child: ListTile(
                            title: index < messages.length
                                ? Text("${message.text ?? "No Message"} $index")
                                : Text("${message.text} sending... $index"),
                          ));
                    }),
              ),
              ChatTextField(chat: chat)
            ],
          );
        });
  }
}
