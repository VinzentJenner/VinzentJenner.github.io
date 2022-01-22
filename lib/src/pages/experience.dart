import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vinzentjenner_github/src/functionality/customClasses.dart';
import 'package:vinzentjenner_github/src/functionality/globals.dart';

class JobExperience extends StatelessWidget {
  final String companyName, workTitle, iconPath;
  final int startYear;
  final int? endYear;

  final companyNameStyle = const TextStyle(fontSize: 50);
  final workTitleStyle = const TextStyle(fontSize: 20);

  JobExperience(
      {Key? key,
      required this.companyName,
      required this.workTitle,
      required this.startYear,
      required this.iconPath,
      this.endYear})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        leading: Image.asset(iconPath),
        title: Text(
          companyName,
          style: companyNameStyle,
        ),
        subtitle: Text(
          workTitle,
          style: workTitleStyle,
        ),
        style: ListTileStyle.list,
      ),
    );
  }
}

class AnimatedListView extends StatefulWidget {
  final List<Widget> listViewData;

  const AnimatedListView({Key? key, required this.listViewData})
      : super(key: key);

  @override
  _AnimatedListViewState createState() => _AnimatedListViewState();
}

class _AnimatedListViewState extends State<AnimatedListView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: widget.listViewData,
    );
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
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 30.0, right: 80.0),
            child: ContinueEndAnimationText(
                text: "Experience", textStyle: const TextStyle(fontSize: 100)),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height,
              child: Align(
                alignment: Alignment.center,
                child: AnimatedListView(listViewData: [
                  JobExperience(
                    companyName: "Software Developer",
                    startYear: 2020,
                    workTitle: 'Cool',
                    endYear: 2022,
                    iconPath: 'assets/images/linkedIn.png',
                  ),
                  JobExperience(
                    companyName: "Software Developer",
                    startYear: 2020,
                    workTitle: 'Cool',
                    endYear: 2022,
                    iconPath: 'assets/images/linkedIn.png',
                  ),
                ]),
              ))
        ],
      ),
    );
  }
}
