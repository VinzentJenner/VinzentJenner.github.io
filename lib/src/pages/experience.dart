import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vinzentjenner_github/src/functionality/globals.dart';

class ExperienceSliver extends StatefulWidget {
  final ScrollController scrollController;
  const ExperienceSliver({Key? key, required this.scrollController}) : super(key: key);

  @override
  _ExperienceSliverState createState() => _ExperienceSliverState();
}

class _ExperienceSliverState extends State<ExperienceSliver> {
  double p = 0;

  @override
  void initState() {
    widget.scrollController.addListener(() {setState(() {
      p = widget.scrollController.offset;
    });});
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
              child: Center(
                  child: Text(
                "$p",
                style: TextStyle(fontSize: 100),
              )),
            )
          ],
        ),
      ),
    );
  }
}
