import 'package:ecampus_library/data/models/document_model.dart';
import 'package:ecampus_library/widgets/BookTile.dart';
import 'package:ecampus_library/widgets/AudioBooksTile.dart';
import 'package:ecampus_library/widgets/AuthorsTile.dart';
import 'package:ecampus_library/widgets/Carousel.dart';
import 'package:ecampus_library/widgets/CategoriesTile.dart';
import 'package:ecampus_library/widgets/CategoryTitle.dart';
import 'package:ecampus_library/screens/public/admin/ReaderScreen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Browsescreen extends StatefulWidget {
  const Browsescreen({Key? key}) : super(key: key);

  @override
  State<Browsescreen> createState() => _BrowsescreenState();
}

class _BrowsescreenState extends State<Browsescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Spacing
            const SizedBox(
              height: 12,
            ),
            //  Carousel
            const Carousel(),
            //  Categories
            Column(
              children: [
                const CategoryTitle(title: "Categories"),
                const SizedBox(
                  height: 10,
                ),

                // TODO: Categories
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: 6,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const CategoriesTile();
                      }),
                ),
              ],
            ),

            const SizedBox(
              height: 30,
            ),

            // TODO: Popular authors
            Column(
              children: [
                const CategoryTitle(
                  title: "Popular Authors",
                ),
                const SizedBox(
                  height: 10,
                ),

                // TODO: Popular Authors
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: 6,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const AuthorTile();
                      }),
                ),
              ],
            ),

            // TODO: Features AudioBooks
            Column(
              children: [
                const CategoryTitle(
                  title: "Features Audiobooks",
                ),
                const SizedBox(
                  height: 10,
                ),

                // TODO: Features AudioBooks
                SizedBox(
                  height: 320,
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: 6,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const AudioBookTile(
                            name: "Abstract art", author: "Armando|");
                      }),
                ),
              ],
            ),

            // TODO: Features Books
            Column(
              children: [
                const CategoryTitle(
                  title: "Features Books",
                ),
                const SizedBox(
                  height: 10,
                ),

                // TODO: Features Books
                SizedBox(
                  height: 320,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: Document.doc_list.map((doc) => BookTile(
                      name: doc.doc_title.toString(), 
                      author: doc.doc_author.toString(), 
                      ontap: (){Get.to(()=> ReaderScreen(doc));
                      },),).toList(),
                  )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
