import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExperienceSliver extends StatefulWidget {
  const ExperienceSliver({Key? key}) : super(key: key);

  @override
  _ExperienceSliverState createState() => _ExperienceSliverState();
}

class _ExperienceSliverState extends State<ExperienceSliver> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.red),
              child: Text("Hello", style: TextStyle(fontSize: 100),),
            )
          ],
        ),
      ),
    );
  }
}
