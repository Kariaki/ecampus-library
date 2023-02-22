import 'package:ecampus_library/constants/constants.dart';
import 'package:ecampus_library/data/controllers/user_controller.dart';
import 'package:ecampus_library/data/models/document_model.dart';
import 'package:ecampus_library/data/models/user_model.dart';
import 'package:ecampus_library/widgets/BookTile.dart';
import 'package:ecampus_library/widgets/AudioBooksTile.dart';
import 'package:ecampus_library/widgets/AuthorsTile.dart';
import 'package:ecampus_library/widgets/Carousel.dart';
import 'package:ecampus_library/widgets/CategoriesTile.dart';
import 'package:ecampus_library/widgets/CategoryTitle.dart';
import 'package:ecampus_library/screens/public/admin/ReaderScreen.dart';
import 'package:ecampus_library/widgets/Drawer.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Browsescreen extends StatefulWidget {
  const Browsescreen({Key? key}) : super(key: key);

  @override
  State<Browsescreen> createState() => _BrowsescreenState();
}

class _BrowsescreenState extends State<Browsescreen> {
  UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width;

    return isMobile > 600
        ? FutureBuilder(
            future: userController.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;
                  return Scaffold(
                    appBar: AppBar(
                      title: Text(AppConstants().appBarTitle),
                      actions: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.search)),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 20),
                          child: Row(
                            children: [
                              Text(
                                  "${userData.firstName} ${userData.lastName}"),
                              const SizedBox(
                                width: 10,
                              ),
                              userData.avatarUrl == null
                                  ? Container(
                                      height: 60,
                                      width: 60,
                                      decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 6,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Icon(Icons.camera_alt),
                                      ),
                                    )
                                  : Container(
                                      height: 45,
                                      width: 45,
                                      decoration: const BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: 6,
                                            offset: Offset(0, 2),
                                          ),
                                        ],
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${userData.firstName![0].toUpperCase()} ${userData.lastName![0].toUpperCase()}",
                                          style: const TextStyle(
                                              color: Colors.indigo,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        )
                      ],
                    ),
                    drawer: const MyDrawer(),
                    body: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:20),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      itemCount: 6,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return const AuthorTile();
                                      }),
                                ),
                      
                                const SizedBox(
                                  height: 10,
                                ),
                                const CategoryTitle(
                                  title: "Features Audiobooks",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                      
                                // TODO: Features AudioBooks
                                SizedBox(
                                  height: 320,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: Document.doc_list
                                        .map(
                                          (doc) => BookTile(
                                            name: doc.doc_title.toString(),
                                            author: doc.doc_author.toString(),
                                            ontap: () {
                                              Get.to(() => ReaderScreen(doc));
                                            },
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                      
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
                                    children: Document.doc_list
                                        .map(
                                          (doc) => BookTile(
                                            name: doc.doc_title.toString(),
                                            author: doc.doc_author.toString(),
                                            ontap: () {
                                              Get.to(() => ReaderScreen(doc));
                                            },
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                              ],
                            ),
                      
                            // TODO: Features Books
                            Column(
                              children: [],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {}
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            })
        : Scaffold(
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
                            children: Document.doc_list
                                .map(
                                  (doc) => BookTile(
                                    name: doc.doc_title.toString(),
                                    author: doc.doc_author.toString(),
                                    ontap: () {
                                      Get.to(() => ReaderScreen(doc));
                                    },
                                  ),
                                )
                                .toList(),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
