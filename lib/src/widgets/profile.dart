import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CircularImage extends StatelessWidget {
  final String path;
  final double width, height;
  const CircularImage(this.path,
      {this.width = 150, this.height = 150, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircleAvatar(
      backgroundImage: AssetImage(path),
      radius: 100.0,
    ));
  }
}

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
              Text("Hej", style: textStyle,),
              SizedBox(height: 20),
              Text("Hejdå", style: textStyle,)],
          ),
          SizedBox(width: 40,),
          CircularImage('assets/images/profile.jpg'),
          SizedBox(width: 40,),
          Column(
            children: [
              Text("Hej", style: textStyle,),
              SizedBox(height: 20),
              Text("Hejdå", style: textStyle,)],
          ),
          IconButton(onPressed: (){}, icon: Image.asset('assets/images/linkedIn.png'))
        ],
      ),
    );
  }
}

class OnLoadAnimation extends StatefulWidget {
  const OnLoadAnimation({Key? key}) : super(key: key);

  @override
  _OnLoadAnimationState createState() => _OnLoadAnimationState();
}

class _OnLoadAnimationState extends State<OnLoadAnimation> {
  final Duration typeSpeed = const Duration(milliseconds: 150);
  final TextStyle textStyle = const TextStyle(fontSize: 200);

  TyperAnimatedText _animatedText(String text)
  {
    return TyperAnimatedText(text, speed: typeSpeed, textStyle: textStyle);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: 
      [Container(
        width: MediaQuery.of(context).size.width*0.75,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            children: [AnimatedTextKit(animatedTexts: [
              _animatedText("Hi,I'm Simon"),
              _animatedText("Hej, jag är Simon")
            ])],
          ),
        )
      ),
      Container(
        width: MediaQuery.of(context).size.width*0.25,)],
    );
  }
}

