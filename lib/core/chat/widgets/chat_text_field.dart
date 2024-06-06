import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:njangi_hub/core/chat/chat.dart';
import 'package:njangi_hub/shared/shared.dart';

class ChatTextField extends ConsumerStatefulWidget {
  const ChatTextField({
    required this.chat,
    super.key,
  });

  final Chat chat;

  @override
  ConsumerState<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends ConsumerState<ChatTextField> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                controller: _textEditingController,
                focusNode: _focusNode,
                onChanged: (value) {},
                textInputAction: TextInputAction.send,
                onEditingComplete: () {},
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
          InkWellIconButton(
              onPressed: () async {
                await sendMessage(
                    text: _textEditingController.text,
                    messageType: AttachmentType.text);
              },
              icon: Icons.send)
          // InkWellIconButton(onPressed: () {}, icon: Icons.mic),
        ],
      ),
    );
  }

  Future<void> sendMessage(
      {required dynamic text, required AttachmentType messageType}) async {
    print('Sending message');
    final chatProvider = ref.read(chatMethodsProvider(widget.chat).notifier);
    await chatProvider.sendMessageToFirestore(
        groupId: widget.chat.chatId,
        text: text,
        messageType: messageType,);
    _textEditingController.clear();
  }
}
