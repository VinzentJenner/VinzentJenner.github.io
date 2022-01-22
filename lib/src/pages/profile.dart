import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:vinzentjenner_github/src/functionality/customClasses.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  final TextStyle textStyle = TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                "Hej",
                style: textStyle,
              ),
              SizedBox(height: 20),
              Text(
                "Hejdå",
                style: textStyle,
              )
            ],
          ),
          SizedBox(
            width: 40,
          ),
          CircularImage('assets/images/profile.jpg'),
          SizedBox(
            width: 40,
          ),
          Column(
            children: [
              Text(
                "Hej",
                style: textStyle,
              ),
              SizedBox(height: 20),
              Text(
                "Hejdå",
                style: textStyle,
              )
            ],
          ),
          IconButton(
              onPressed: () {}, icon: Image.asset('assets/images/linkedIn.png'))
        ],
      ),
    );
  }
}

class OnLoadAnimationSliver extends StatefulWidget {
  const OnLoadAnimationSliver({Key? key}) : super(key: key);
  @override
  _OnLoadAnimationSliverState createState() => _OnLoadAnimationSliverState();
}

class _OnLoadAnimationSliverState extends State<OnLoadAnimationSliver> {
  final Duration typeSpeed = const Duration(milliseconds: 150);
  final TextStyle textStyle = const TextStyle(fontSize: 150);

  TypewriterAnimatedText _animatedText(String text) {
    return TypewriterAnimatedText(text,
        speed: typeSpeed, textStyle: textStyle, cursor: '_');
  }

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Row(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.65,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedTextKit(repeatForever: true, animatedTexts: [
                    _animatedText("Hi, my name is"),
                    _animatedText("Hej, jag heter")
                  ]),
                  Text(
                    "Simon",
                    style: textStyle,
                  )
                ],
              )),
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: CircularImage("assets/images/profile.jpg"),
              )
            ],
          )
        ],
      ),
    );
  }
}
