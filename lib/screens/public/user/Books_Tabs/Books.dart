import 'package:ecampus_library/widgets/BookTile.dart';
import 'package:ecampus_library/data/models/document_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ReaderScreen.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({Key? key}) : super(key: key);

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GridView(
            primary: false,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 320,
            ),
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
      ),
    );
  }
}
