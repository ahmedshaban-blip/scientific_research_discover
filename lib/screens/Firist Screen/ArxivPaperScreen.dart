import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scientific_research_discover/cubit/arxiv_paper_cubit.dart';
import 'package:scientific_research_discover/screens/Filters%20Screen.dart';
import 'package:scientific_research_discover/screens/Research%20Detail%20Screen.dart';
import 'package:page_transition/page_transition.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'SciRes Discover',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
            shadows: [
              Shadow(
                offset: Offset(2, 2),
                blurRadius: 2,
                color: Colors.grey[300]!,
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.filter_list,
              color: Colors.white,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => FiltersScreen(),
              );
            },
          ),
        ],
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _SearchBar(),
            SizedBox(height: 16), 
            Expanded(
              child: BlocBuilder<ArxivPaperCubit, List<ArxivPaper>>(
                builder: (context, papers) {
                  if (papers.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Search what you need',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height: 16),
                          Icon(
                            Icons.search,
                            size: 80,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: papers.length,
                    itemBuilder: (context, index) {
                      final paper = papers[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        color: Colors.white,
                        elevation: 4,
                        child: ListTile(
                          title: Text(
                            paper.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          
                          subtitle: Text(
                            paper.authors,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.start,
                          ),
                          onTap: () {
                           Navigator.push(
  context,
  PageTransition(
    type: PageTransitionType.fade,
    duration: Duration(milliseconds: 500),
    curve: Curves.easeInOut,
    child: PaperDetailScreen(paper: paper),
  ),
);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatefulWidget {
  @override
  __SearchBarState createState() => __SearchBarState();
}

class __SearchBarState extends State<_SearchBar> {
  final TextEditingController _controller = TextEditingController();

  void _onSearch() {
    final query = _controller.text;
    if (query.isNotEmpty) {
      context.read<ArxivPaperCubit>().fetchPapers(query);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      decoration: InputDecoration(
        hintText: 'Search ...',
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            width: 2,
            color: Colors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide(
            width: 2,
            color: Colors.black,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: _onSearch,
        ),
      ),
      onSubmitted: (_) => _onSearch(),
    );
  }
}

