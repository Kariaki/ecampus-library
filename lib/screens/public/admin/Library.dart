import 'package:ecampus_library/screens/public/admin/Library_Tabs/AudioBooks.dart';
import 'package:ecampus_library/screens/public/admin/Library_Tabs/Books.dart';
import 'package:flutter/material.dart';

class MyLibraryScreen extends StatefulWidget {
  const MyLibraryScreen({Key? key}) : super(key: key);

  @override
  State<MyLibraryScreen> createState() => _MyLibraryScreenState();
}

class _MyLibraryScreenState extends State<MyLibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              // Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.filter_alt)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                ],
              ),

              //TabBar
               TabBar(
                labelColor: Colors.indigo[400],
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(
                    text: "Books",
                  ),
                  Tab(
                    text: "Audiobooks",
                  ),
                ],
              ),

              const Expanded(
                child: TabBarView(children: [

                //  Books
                  Books(),

                //  AudioBooks
                  AudioBooks(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
