import 'package:ecampus_library/constants/constants.dart';
import 'package:ecampus_library/screens/public/admin/Books_Tabs/Audio_books.dart';
import 'package:ecampus_library/screens/public/admin/Books_Tabs/Books.dart';
import 'package:ecampus_library/widgets/Drawer.dart';
import "package:flutter/material.dart";

class BooksScreen extends StatelessWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width;

    return isMobile > 600 
    ? DefaultTabController(
      length: 2,
      child: Scaffold( 
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: Text(AppConstants().appBarTitle),
        ),
        body: SafeArea(
          child: Column(
            children: [
              //TabBar
              TabBar(
                labelColor: Colors.indigo[700],
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
    )
    : DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: Text(AppConstants().appBarTitle),
        ),
        body: SafeArea(
          child: Column(
            children: [
              //TabBar
              TabBar(
                labelColor: Colors.indigo[700],
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
