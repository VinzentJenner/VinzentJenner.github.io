import 'package:flutter/material.dart';
import 'package:vinzentjenner_github/src/pages//experience.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vinzentjenner_github/src/pages/navigation_bar.dart';
import 'package:vinzentjenner_github/src/pages/profile.dart';

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
  final ScrollController scrollController = ScrollController();
  final scrollViewKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.orange),
            floating: true,
          ),
          OnLoadAnimationSliver(),
          ExperienceSliver(scrollController: scrollController,),
        ],
      ),
      drawer: Drawer(
        child: Menu(
          scrollController: scrollController,
        ),
      ),
    );
  }

  getF() {
    Scrollable.ensureVisible(context);
    return 4;
  }
}
