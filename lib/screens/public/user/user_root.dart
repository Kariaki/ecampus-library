import 'package:ecampus_library/screens/public/user/Account.dart';
import 'package:ecampus_library/screens/public/user/Books.dart';
import 'package:ecampus_library/screens/public/user/Browse.dart';
import 'package:ecampus_library/screens/public/user/Chat.dart';
import 'package:ecampus_library/screens/public/user/Classes.dart';
import 'package:ecampus_library/screens/public/user/Library.dart';
import 'package:flutter/material.dart';

class UserRoot extends StatefulWidget {
  const UserRoot({super.key});

  @override
  State<UserRoot> createState() => _UserRootState();
}

class _UserRootState extends State<UserRoot> {
  int currentIndex = 0;
  final screens = [
    const Browsescreen(),
    const BooksScreen(),
    const ClassScreen(),
    const MyLibraryScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ChatScreen()));
        },
        child: const Icon(Icons.message),
      ),
      bottomNavigationBar:  NavigationBarTheme(
        data: const NavigationBarThemeData(
            labelTextStyle: MaterialStatePropertyAll(TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.bold))),
        child: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: "Home"),
            NavigationDestination(
                icon: Icon(Icons.auto_stories_outlined),
                selectedIcon: Icon(Icons.auto_stories),
                label: "Books"),
            NavigationDestination(
                icon: Icon(Icons.groups_outlined),
                selectedIcon: Icon(Icons.groups),
                label: "My Class"),
            NavigationDestination(
                icon: Icon(Icons.local_library_outlined),
                selectedIcon: Icon(Icons.local_library),
                label: "My Library"),
            NavigationDestination(
                icon: Icon(Icons.person_outline_outlined),
                selectedIcon: Icon(Icons.person),
                label: "Account"),
          ],
        ),
      ),
    );
  }
}