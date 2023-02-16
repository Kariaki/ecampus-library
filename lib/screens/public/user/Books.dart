import 'package:ecampus_library/screens/public/user/Books_Tabs/Audio_books.dart';
import 'package:ecampus_library/screens/public/user/Books_Tabs/Books.dart';
import "package:flutter/material.dart";

class BooksScreen extends StatelessWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          
          title: const Text("Books"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
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
                  BookScreen(),

                  //  AudioBooks
                  AudioBooksScreen(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
