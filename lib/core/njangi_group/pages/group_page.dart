import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:njangi_hub/core/njangi_group/njangi_groups.dart';
import 'package:njangi_hub/shared/shared.dart' as nj;
import 'package:skeletonizer/skeletonizer.dart';

class NjangiGroupPage extends StatelessWidget {
  NjangiGroupPage({super.key});
  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final groupId = ModalRoute.of(context)?.settings.arguments as String?;
    late NjangiGroup group;
    if (groupId == null) {
      return const nj.DisplayErrorWidget();
    }
    final Stream<DocumentSnapshot<Map<String, dynamic>>> groupStream =
        firestore.collection("njangi-groups").doc(groupId).snapshots();

    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: groupStream,
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return nj.DisplayErrorWidget(error: snapshot.error,);
          }

          if(snapshot.hasData){
              try{
                group = NjangiGroup.fromJson(snapshot.data?.data() as Map<String, dynamic>);
              } catch (e) {
                return nj.DisplayErrorWidget(error: snapshot.error,);
              }
          }

            return Skeletonizer.sliver(
              enabled: snapshot.connectionState == ConnectionState.waiting,
              child: Scaffold(
                  appBar: AppBar(
                    title: Text(group.name),
                  ),
                  body: const Center(
                    child: Text('Group Page'),
                  )),
            );
          }
        );
  }
}
