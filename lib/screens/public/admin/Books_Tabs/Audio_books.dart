import 'package:ecampus_library/widgets/AudioBooksTile.dart';
import 'package:flutter/material.dart';

class AudioBooksScreen extends StatefulWidget {
  const AudioBooksScreen({Key? key}) : super(key: key);

  @override
  State<AudioBooksScreen> createState() => _AudioBooksScreenState();
}

class _AudioBooksScreenState extends State<AudioBooksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: GridView.builder(
            primary: false,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 320,
            ),
            itemBuilder: (BuildContext context, int ind) => const Expanded(child: AudioBookTile(author: 'hi', name: 'Dio',)),
          ),
        ),
      ),
    );
  }
}
