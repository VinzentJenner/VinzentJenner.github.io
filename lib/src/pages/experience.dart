import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vinzentjenner_github/src/functionality/TextWidgets.dart';
import 'package:vinzentjenner_github/src/functionality/globals.dart';

class JobExperience extends StatelessWidget {
  final String title, description;
  final int startYear;
  final int? endYear;

  JobExperience(
      {Key? key,
      required this.title,
      required this.description,
      required this.startYear,
      this.endYear})
      : super(key: key);

  final TextStyle titleTextStyle = TextStyle(fontSize: 100);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: ContinueEndAnimationText(
          text: "hejsan", textStyle: TextStyle(fontSize: 50)),
    );
  }
}

class AnimatedListView extends StatefulWidget {
  final List<Widget> listViewData;
  const AnimatedListView({Key? key, required this.listViewData}) : super(key: key);

  @override
  _AnimatedListViewState createState() => _AnimatedListViewState();
}

class _AnimatedListViewState extends State<AnimatedListView> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: widget.listViewData,);
  }
}


class ExperienceSliver extends StatefulWidget {
  final ScrollController scrollController;

  const ExperienceSliver({Key? key, required this.scrollController})
      : super(key: key);

  @override
  _ExperienceSliverState createState() => _ExperienceSliverState();
}

class _ExperienceSliverState extends State<ExperienceSliver> {
  double p = 0;

  @override
  void initState() {
    widget.scrollController.addListener(() {
      setState(() {
        p = widget.scrollController.offset;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                    child: Center(
                  child: JobExperience(
                    title: "Hej",
                    description: 'H',
                    startYear: 2010,
                  ),
                ))
              ],
            ),
            Row(
              children: [

                Container(

                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
