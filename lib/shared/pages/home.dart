import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:njangi_hub/generated/assets.dart';

class MyHomePage extends HookWidget {

   final List<Widget> _widgetOptions = const <Widget>[
    Text('Home'),
    Text('Search'),
    Text('Profile'),
  ];

  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: (){},
          iconSize: 30,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white12),
          ),
          icon: const Icon(Icons.person),
        ),
        title: Text('NjangiHub', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700, color: Theme.of(context).primaryColor)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){},
            iconSize: 30,
            icon: const Icon(Icons.search),
          ),
          IconButton(onPressed: (){}, icon: const Icon(Icons.menu))
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex.value),
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