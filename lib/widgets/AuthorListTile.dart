import 'package:flutter/material.dart';

class AuthorListTile extends StatelessWidget {
  const AuthorListTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        child: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.indigo,
              child: Text("S"),
            ),

            Spacer(
              flex: 1,
            ),

            //TODo: NAme

            const Text.rich(
                TextSpan(text: "helosdlifasldjbladfjvbsl;jfgbladflgvbzsklc|")),

            Spacer(
              flex: 3,
            ),

            //TODO: Floating Button
            ElevatedButton(onPressed: () {}, child: const Text("Follow"))
          ],
        ),
      ),
    );
  }
}
