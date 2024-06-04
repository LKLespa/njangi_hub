import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:njangi_hub/core/njangi_group/njangi_groups.dart';
import 'package:njangi_hub/shared/shared.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:toastification/toastification.dart';

class SearchNjangiGroupsPage extends StatefulHookConsumerWidget {
  const SearchNjangiGroupsPage({super.key});

  @override
  ConsumerState<SearchNjangiGroupsPage> createState() =>
      _UsersNjangiGroupsPageState();
}

class _UsersNjangiGroupsPageState
    extends ConsumerState<SearchNjangiGroupsPage> {
  final firebaseUser = firebase.FirebaseAuth.instance.currentUser;
  final groupsQuery = FirebaseFirestore.instance
      .collection("njangi-groups")
      .orderBy('dateCreated');
  List<Group> allGroups = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    Future<void> getGroups() async {
      setState(() {
        isLoading = true;
      });
      final querySnapshot = await groupsQuery.get();
      allGroups = querySnapshot.docs
          .map((doc) => NjangiGroup.fromJson(doc.data()))
          .toList();
      setState(() {
        isLoading = false;
      });
    }

    getGroups();
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<List<Group>> groups = useState([]);
    final itemCount = useState(0);
    final searchString = useState('');

    Future<void> searchGroups(String searchText) async {
      itemCount.value = 0;
      searchText = searchText.trim().toLowerCase();
      if (searchText.isEmpty) {
        groups.value = [];
        return;
      }
      try {
        groups.value = allGroups
            .where((group) => (group.name.toLowerCase().contains(searchText) ||
                group.description!.toLowerCase().contains(searchText)))
            .toList();
        itemCount.value = groups.value.length;
      } catch (e) {
        toast(message: e.toString(), type: ToastificationType.error);
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            CupertinoSearchTextField(
                onChanged: (value) {
                  searchString.value = value.trim();
                  searchGroups(value);
                },
                placeholder: "Search...",
                style: TextStyle(
                    color: Theme.of(context) == darkTheme
                        ? Colors.white
                        : Colors.black),
                prefixIcon: const Icon(Icons.search),
                suffixIcon: const Icon(Icons.cancel)),
            Expanded(
              child: searchString.value.isEmpty
                  ? const Center(
                      child: Text("Search Groups"),
                    )
                  : groups.value.isEmpty
                      ? const Center(
                          child: Text("No Groups"),
                        )
                      : Skeletonizer(
                          enabled: isLoading,
                          child: ListView.builder(
                            itemCount: itemCount.value,
                            itemBuilder: (context, index) {
                              final group = groups.value[index];
                              // final membersCount = group.groupMembers.length;
                              return ListTile(
                                title: Text(group.name),
                                dense: true,
                                subtitle: Text(
                                  "${group.description}",
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // trailing: Text(
                                //   "$membersCount\nmember${membersCount == 1 ? "" : "s"}",
                                //   textAlign: TextAlign.center,
                                // ),
                                leading: Hero(
                                  tag: group.gid,
                                  child: UserImageAvatar(
                                    imageSource: FileSource.cachedNetwork,
                                    url: group.photo,
                                  ),
                                ),
                                onTap: () => showModalBottomSheet(
                                    context: context,
                                    builder: (_) => JoinGroup(groupId: group.gid,)),
                              );
                            },
                          ),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
