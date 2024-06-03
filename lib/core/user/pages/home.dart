import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:njangi_hub/core/authentication/authentication.dart';
import 'package:njangi_hub/core/njangi_group/njangi_groups.dart';
import 'package:njangi_hub/core/user/pages/all_user.dart';
import 'package:njangi_hub/core/user/pages/profile_page.dart';
import 'package:njangi_hub/shared/shared.dart';

class MyHomePage extends HookConsumerWidget {
  final List<Widget> _widgetOptions = const <Widget>[
    UsersNjangiGroups(),
    SearchNjangiGroupsPage(),
    AllUsersPage(),
    ProfilePage(),
  ];

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  
    final selectedIndex = useState(0);
    final authState = ref.watch(authNotifierProvider);
    final user = authState.user;
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
        leading:  Hero(
          tag: TagNames.profilePhoto,
          child: UserImageAvatar(
            url: user.photo,
            imageSource: FileSource.cachedNetwork,
            onTap: () => Navigator.of(context).pushNamed(PageRoutes.settings),
          ),
        ),
        title: Text('NjangiHub',
            style: TextStyle(color: Theme.of(context).primaryColor)),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ],
      ),
      body: _widgetOptions[selectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey.shade700,
        unselectedLabelStyle: TextStyle(color: Colors.grey.shade700),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_sharp),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
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
