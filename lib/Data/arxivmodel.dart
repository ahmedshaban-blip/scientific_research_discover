class ArxivPaper {
  final String title;
  final List<String> authors;
  final String summary;
  final String publishedDate;
  final String url;

  ArxivPaper({
    required this.title,
    required this.authors,
    required this.summary,
    required this.publishedDate,
    required this.url,
  });

  // تحويل JSON إلى نموذج ArxivPaper
  factory ArxivPaper.fromJson(Map<String, dynamic> json) {
    return ArxivPaper(
      title: json['title'] ?? '',
      authors: List<String>.from(json['authors'] ?? []),
      summary: json['summary'] ?? '',
      publishedDate: json['published'] ?? '',
      url: json['id'] ?? '',
    );
  }
}
