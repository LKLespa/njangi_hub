import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:njangi_hub/core/authentication/authentication.dart';
import 'package:njangi_hub/shared/shared.dart';

class MyHomePage extends HookConsumerWidget {
  final List<Widget> _widgetOptions = const <Widget>[
    Text('Home'),
    Text('Search'),
    Text('Profile'),
  ];

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);
    final user = ref.watch(authNotifierProvider).user;
    print("User: $user");
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
        leading: UserImageAvatar(url: user.photo, imageSource: FileSource.cachedNetwork, onTap: () => Navigator.of(context).pushNamed(PageRoutes.profile),),
        title: Text('NjangiHub',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColor)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            iconSize: 30,
            icon: const Icon(Icons.search),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
        ],
      ),
      body: Center(
        child: UserImageAvatar(url: user.photo, imageSource: FileSource.cachedNetwork, onTap: () => Navigator.of(context).pushNamed(PageRoutes.profile),),
      ),
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

class UserImageAvatar extends StatelessWidget {
  const UserImageAvatar(
      {super.key, this.url, this.onTap, this.radius = 25, required this.imageSource});

  final String? url;
  final void Function()? onTap;
  final double radius;
  final FileSource imageSource;

  @override
  Widget build(BuildContext context) {
    final imageProvider = getImageProviderFromSource(path: url, source: imageSource, placeholder: Assets.imagesUser);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CircleAvatar(
          backgroundImage: imageProvider,
        )
      ),
    );
  }
}