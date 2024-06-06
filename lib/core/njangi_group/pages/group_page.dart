import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:njangi_hub/core/chat/chat.dart';
import 'package:njangi_hub/core/njangi_group/njangi_groups.dart';
import 'package:njangi_hub/shared/shared.dart';
import 'package:njangi_hub/shared/shared.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:toastification/toastification.dart';

class NjangiGroupPage extends HookConsumerWidget {
  NjangiGroupPage({super.key});
  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    NjangiGroup group =
        ModalRoute.of(context)?.settings.arguments as NjangiGroup;
    bool isLoading = true;
    final groupRef = firestore.collection("njangi-groups").doc(group.gid);
    final Stream<DocumentSnapshot<Map<String, dynamic>>> groupStream = groupRef.snapshots();
    List<Message> messages = [];

    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: groupStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Has Error');
            return DisplayErrorWidget(
              error: snapshot.error,
            );
          }

          if (snapshot.hasData) {
            try {
              group = NjangiGroup.fromJson(
                  snapshot.data?.data() as Map<String, dynamic>);
            } catch (e) {
              return DisplayErrorWidget(
                error: snapshot.error,
              );
            }
            print('Has data');
            isLoading = false;
          }

          if (snapshot.connectionState == ConnectionState.done) {
            print('Done');
          }
          return Skeletonizer(
            enabled: isLoading,
            child: Scaffold(
                appBar: AppBar(
                  titleSpacing: -25,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  title: ListTile(
                    leading: UserImageAvatar(
                      url: group.photo,
                      imageSource: FileSource.cachedNetwork,
                      fallbackUrl: Assets.imagesGroup,
                    ),
                    title: Text(group.name, style: const TextStyle(fontSize: 16)),
                    subtitle: Text(group.description ?? "", overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12)),
                  ),
                  actions: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
                  ],
                ),
                body: ChatScreen(chatId: group.gid, isGroup: true, isNjangiGroup: true,),
            ),
          );
        });
  }
}