import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HoverText extends StatefulWidget {
  final String text;
  final double fontSize;
  final Color textColor, hoverColor;
  final ScrollController? scrollController;
  final Function? onPressed;

  const HoverText(this.text,
      {Key? key,
      this.fontSize = 20.0,
      this.hoverColor = Colors.orange,
      this.textColor = Colors.black,
      this.scrollController,
      this.onPressed})
      : super(key: key);

  @override
  HoverTextState createState() => HoverTextState();
}

class HoverTextState extends State<HoverText> {
  bool _hovering = false;
  final hoverTransform = Matrix4.identity()..scale(1.5);

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
        fontSize: 20.0,
        color: _hovering ? widget.hoverColor : widget.textColor);
    var trans = _hovering ? hoverTransform : Matrix4.identity();

    return TextButton(
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent)),
      onHover: (e) {
        setState(() {
          _hovering = e;
        });
      },
      onPressed: () {
        widget.scrollController?.animateTo(10,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastOutSlowIn);
        widget.onPressed?.call();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 50),
        transform: trans,
        child: Text(
          widget.text,
          style: textStyle,
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}

class ContinueEndAnimationText extends StatelessWidget {
  final String animationSign, text;
  late final Duration durationMilliseconds;
  final TextStyle textStyle;

  ContinueEndAnimationText(
      {required this.text,
      this.animationSign = "_",
      required this.textStyle,
      int durationMilliseconds = 400}) {
    this.durationMilliseconds = Duration(milliseconds: durationMilliseconds);
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        text,
        style: textStyle,
      ),
      AnimatedTextKit(
          repeatForever: true,
          pause: durationMilliseconds,
          animatedTexts: [
        TypewriterAnimatedText("",
            speed: durationMilliseconds,
            cursor: animationSign,
            textStyle: textStyle)
      ])
    ]);
  }
}
