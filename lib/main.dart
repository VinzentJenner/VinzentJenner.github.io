import 'package:flutter/material.dart';
import 'package:vinzentjenner_github/src/widgets/experience.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vinzentjenner_github/src/widgets/navigation_bar.dart';
import 'package:vinzentjenner_github/src/widgets/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.getTextTheme("Raleway"),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.orange),
            floating: true,
          ),
          OnLoadAnimationSliver(),
          ExperienceSliver(),
        ],
      ),
      drawer: Drawer(
        child: Menu(),
      ),
    );
  }
}
