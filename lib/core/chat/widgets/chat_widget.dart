import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:njangi_hub/core/chat/chat.dart';
import 'package:njangi_hub/core/njangi_group/njangi_groups.dart';
import 'package:njangi_hub/shared/shared.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ChatScreen extends HookConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NjangiGroup group =
    ModalRoute.of(context)?.settings.arguments as NjangiGroup;
    bool isLoading = true;

          return Column(
              // alignment: Alignment.bottomCenter,
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: 20,
                      itemBuilder:
                          (BuildContext context, int index) {
                        const message = "Message";
                        return Card(
                            elevation: 0.5,
                            child: ListTile(
                              title: Text("$message $index"),
                            )
                        );
                      }),
                ),
                ChatTextField(
                  chatId: group.gid,
                  onSendMessage: (message) {},),
              ],
            );
  }
}