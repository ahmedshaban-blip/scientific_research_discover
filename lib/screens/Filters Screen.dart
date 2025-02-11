import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scientific_research_discover/cubit/arxiv_paper_cubit.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final yearController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Filters',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: _FiltersForm(
          yearController: yearController,
          onSubmit: (year) {
            context.read<ArxivPaperCubit>().fetchPapers(year);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class _FiltersForm extends StatelessWidget {
  final TextEditingController yearController;
  final void Function(String year) onSubmit;

  const _FiltersForm({
    required this.yearController,
    required this.onSubmit,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          TextField(
            controller: yearController,
            decoration: InputDecoration(
              labelText: 'Year',
              labelStyle: const TextStyle(
                color: Colors.grey,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.teal,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onSubmitted: (value) => onSubmit(value),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => onSubmit(yearController.text),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Apply Filters',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


