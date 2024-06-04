import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:njangi_hub/core/chat/chat.dart';
import 'package:njangi_hub/shared/shared.dart';

class ChatTextField extends HookWidget {
  const ChatTextField({
    super.key,
    required this.chatId,
    required this.onSendMessage,
    this.onSendAttachment,
  });
  final String chatId;
  final Function(String message) onSendMessage;
  final Function(File attachment)? onSendAttachment;

  @override
  Widget build(BuildContext context) {
    void sendMessage() {}

    void showAttachmentModal() {
      showModalBottomSheet(
          context: context,

          builder: (_) {
            return const AttachmentModal();
          });
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: TextField(
                maxLines: 5,
                minLines: 1,
                onChanged: (value) {},
                textInputAction: TextInputAction.send,
                onEditingComplete: sendMessage,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    gapPadding: 2,
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    gapPadding: 2,
                    borderSide: const BorderSide(color: primaryColor, width: 2),
                  ),
                  hintText: "Type a message",
                  prefixIcon: IconButton(
                    onPressed: showAttachmentModal,
                    icon: const Icon(Icons.attach_file),
                  ),
                ),
              ),
            ),
          ),
          true
              ? InkWellIconButton(onPressed: sendMessage, icon: Icons.send)
              : InkWellIconButton(onPressed: () {}, icon: Icons.mic),
        ],
      ),
    );
  }
}
