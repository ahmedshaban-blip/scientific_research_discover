// ignore_for_file: deprecated_member_use, avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class ArxivPaperCubit extends Cubit<List<ArxivPaper>> {
  ArxivPaperCubit() : super([]);

  Future<void> fetchPapers(String query) async {
    try {
      final response = await http.get(Uri.parse(
          'https://export.arxiv.org/api/query?search_query=all:$query&start=0&max_results=10'));

      if (response.statusCode == 200) {
        final data = xml.XmlDocument.parse(response.body);

        final List<ArxivPaper> papers = [];
        final entries = data.findAllElements('entry');
        for (var entry in entries) {
          papers.add(ArxivPaper(
            title: entry.findElements('title').single.text,
            authors: entry.findElements('author').map((e) => e.findElements('name').single.text).join(", "),
            abstract: entry.findElements('summary').single.text,
            url: entry.findElements('id').single.text,
          ));
        }
        emit(papers);
      } else {
        emit([]);
      }
    } catch (e) {
      print("Error fetching papers: $e");
      emit([]);
    }
  }
}

class ArxivPaper {
  final String title;
  final String authors;
  final String abstract;
  final String url;

  ArxivPaper({
    required this.title,
    required this.authors,
    required this.abstract,
    required this.url,
  });
}
