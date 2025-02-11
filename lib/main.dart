import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scientific_research_discover/cubit/arxiv_paper_cubit.dart';
import 'package:scientific_research_discover/firebase_options.dart';
import 'package:scientific_research_discover/screens/home/SignInScreen.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ArxivPaperCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Arxiv Papers',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignInScreenWidget(),
      ),
    );
  }
}
