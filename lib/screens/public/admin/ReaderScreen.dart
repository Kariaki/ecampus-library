import 'package:ecampus_library/data/models/document_model.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/material.dart';

class ReaderScreen extends StatefulWidget {
  ReaderScreen(this.doc,{Key? key}) : super(key: key);
  Document doc;

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.doc.doc_title!.toString()),
      ),
      body: SafeArea(
        child: Container(
          child: SfPdfViewer.network(widget.doc.doc_url!.toString()),
        ),
      ),
    );
  }
}
