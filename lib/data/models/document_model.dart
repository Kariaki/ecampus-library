class Document {
  String? doc_title;
  String? doc_url;
  String? doc_author;

  Document(
    this.doc_author,
    this.doc_title,
    this.doc_url,
  );

  static List<Document> doc_list = [
    Document(
      "RipTutorial",
      "Mechine Learning",
      "https://riptutorial.com/Download/machine-learning.pdf",
    ),
    Document(
      "Python,org",
      "Python",
      "https://bugs.python.org/file47781/Tutorial_EDIT.pdf",
    ),
    Document(
      "syncfusion",
      "syncfusion pdfViewer",
      "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf",
    ),
  ];
}
