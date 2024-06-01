import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:njangi_hub/core/njangi_group/models/njangi_group.dart';
import 'package:njangi_hub/shared/shared.dart';
import 'package:njangi_hub/shared/widgets/error_widget.dart' as err;
import 'package:skeletonizer/skeletonizer.dart';

class UsersNjangiGroups extends StatefulHookConsumerWidget {
  const UsersNjangiGroups({super.key});

  @override
  ConsumerState<UsersNjangiGroups> createState() => _UsersNjangiGroupsState();
}

class _UsersNjangiGroupsState extends ConsumerState<UsersNjangiGroups> {
  final firebaseUser = firebase.FirebaseAuth.instance.currentUser;
  late Stream<QuerySnapshot> _usersNjangiGroupsStream;

  @override
  void initState() {
    super.initState();
    _usersNjangiGroupsStream = FirebaseFirestore.instance
        .collection("groups")
        .where("members", arrayContains: {"uid": firebaseUser?.uid})
        .orderBy('dateCreated')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    final searchText = useState("");
    final groupFilter = useState(GroupMemberStatus.member);
    int itemCount = 0;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            CupertinoSearchTextField(
                onChanged: (value) => searchText.value = value,
                placeholder: "Search...",
                style: TextStyle(color: Theme.of(context) == darkTheme ? Colors.white : Colors.black),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.cancel)),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _usersNjangiGroupsStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return err.ErrorWidget(
                      error: snapshot.error,
                    );
                  }

                  List<NjangiGroup> groups = [];
                  if (snapshot.hasData) {
                    itemCount = snapshot.data!.docs.length;
                    groups = snapshot.data!.docs
                        .map((doc) => NjangiGroup.fromJson(
                            doc.data() as Map<String, dynamic>))
                        .toList();
                  }

                  if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text("No Groups"));
                  }

                  return Skeletonizer(
                    enabled:
                        snapshot.connectionState == ConnectionState.waiting,
                    child: ListView.builder(
                      itemCount: itemCount,
                      itemBuilder: (context, index) {
                        final group = groups[index];
                        final membersCount = group.groupMembers.length;
                        return ListTile(
                          title: Text(group.name),
                          dense: true,
                          subtitle: Text(
                            "${group.description}",
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Text(
                            "$membersCount\nmember${membersCount == 1 ? "" : "s"}",
                            textAlign: TextAlign.center,
                          ),
                          leading: Hero(
                            tag: group.gid,
                            child: UserImageAvatar(
                              imageSource: FileSource.cachedNetwork,
                              url: group.photo,
                            ),
                          ),
                          onTap: () => Navigator.of(context).pushNamed(
                              PageRoutes.usersProfile,
                              arguments: group),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (BuildContext context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ChoiceChip(
                  label: const Text('Groups'),
                  selected: groupFilter.value == GroupMemberStatus.member,
                  side: const BorderSide(style: BorderStyle.none),
                  selectedColor: primaryColor,
                  onSelected: (_) => groupFilter.value = GroupMemberStatus.member
              ),
              ChoiceChip(
                label: const Text('Invites'),
                selected: groupFilter.value == GroupMemberStatus.invite,
                side: const BorderSide(style: BorderStyle.none),
                selectedColor: primaryColor,
                  onSelected: (_) => groupFilter.value = GroupMemberStatus.invite
              ),
              ChoiceChip(
                label: const Text('Requests'),
                selected: groupFilter.value == GroupMemberStatus.request,
                side: const BorderSide(style: BorderStyle.none),
                selectedColor: primaryColor,
                  onSelected: (_) => groupFilter.value = GroupMemberStatus.request
              ),
            ],
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: FloatingActionButton(
          onPressed: () => Navigator.of(context).pushNamed(PageRoutes.createGroup),
          tooltip: "Create Group",
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
