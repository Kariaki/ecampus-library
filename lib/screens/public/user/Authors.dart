import 'package:ecampus_library/widgets/AuthorListTile.dart';
import 'package:flutter/material.dart';

class AuthorsScreen extends StatelessWidget {
  const AuthorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.chevron_left)),

            //SPACING
            SizedBox(
              height: 5,
            ),

            // Title
            const Text(
              "Authors",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),

            // Authors

            Expanded(
                flex: 1,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) => const AuthorListTile()))
          ],
        ),
      ),
    );
  }
}
