// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:scientific_research_discover/cubit/arxiv_paper_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

class PaperDetailScreen extends StatelessWidget {
  final ArxivPaper paper;

  const PaperDetailScreen({super.key, required this.paper});

  Future<void> _launchURL(BuildContext context, String url) async {
    if (url.startsWith("http://")) {
      url = url.replaceFirst("http://", "https://");
    }
    if (url.contains('/abs/')) {
      url = url.replaceFirst('/abs/', '/pdf/');
      if (!url.endsWith('.pdf')) {
        url = '$url.pdf';
      }
    }
    String modifiedUrl = "https://docs.google.com/gview?embedded=true&url=${Uri.encodeComponent(url)}";
    final Uri uri = Uri.parse(modifiedUrl);

    try {
      if (await canLaunchUrl(uri)) {
        final bool launched = await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
        if (!launched) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('تعذر فتح الرابط: ${uri.toString()}')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('لا يوجد تطبيق لفتح الرابط: ${uri.toString()}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('حدث خطأ أثناء محاولة فتح الرابط: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          paper.title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                paper.title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Authors: ${paper.authors}',
                style: const TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Abstract: ${paper.abstract}',
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _launchURL(context, paper.url),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 32,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child:  Text(
                    'Read The Book',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
