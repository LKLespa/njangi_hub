import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:njangi_hub/core/authentication/authentication.dart';
import 'package:njangi_hub/core/user/pages/all_user.dart';
import 'package:njangi_hub/shared/shared.dart';

class MyHomePage extends HookConsumerWidget {
  final List<Widget> _widgetOptions = const <Widget>[
    Text('Groups'),
    Text('Search'),
    Text('Profile'),
  ];

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);
    final authState = ref.watch(authNotifierProvider);
    final user = authState.user;
    print("User: $user");
    print("Firebase User: ${FirebaseAuth.instance.currentUser}");
    if (user == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('NjangiHub',
            style: TextStyle(color: Theme.of(context).primaryColor)),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          Hero(
            tag: TagNames.profilePhoto,
            child: UserImageAvatar(
              url: user.photo,
              imageSource: FileSource.cachedNetwork,
              onTap: () => Navigator.of(context).pushNamed(PageRoutes.settings),
            ),
          ),
        ],
      ),
      body: const AllUsersPage(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_sharp),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule_send),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex.value,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: (index) => selectedIndex.value = index,
      ),
    );
  }
}
