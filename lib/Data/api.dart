import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:scientific_research_discover/Data/arxivmodel.dart';

Future<List<ArxivPaper>> fetchArxivPapers(String query, String category) async {
  final url = Uri.parse('https://api.arxiv.org/search/?query=$query+AND+cat:$category&start=0&max_results=5');
  
  final response = await http.get(url);
  
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final papers = (data['entries'] as List)
        .map((paper) => ArxivPaper.fromJson(paper))
        .toList();
    return papers;
  } else {
    throw Exception('Failed to load papers');
  }
}
