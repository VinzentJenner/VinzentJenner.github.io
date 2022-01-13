import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_launcher/url_launcher.dart';

//https://dariadobszai.medium.com/interactive-navigation-items-in-flutter-web-7fccc5975779

void _openLinkedIn() async {
  var _url = 'https://www.linkedin.com/in/simon-jenner-a9a0a4139/';
  if (!await launch(_url)) throw 'Could not launch $_url';
}
//Drawer -----------------------

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

class Menu extends StatefulWidget {
  final ScrollController scrollController;
  const Menu({required this.scrollController});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  late final double sliverHeight;
  late AnimationController _staggeredController;
  double get height => MediaQuery.of(context).size.height;
  double get width => MediaQuery.of(context).size.width;

  static const _menuTitles = ["Profile", "Experience", "Projects"];

  static const _initialDelayTime = Duration(milliseconds: 200);
  static const _itemSlideTime = Duration(milliseconds: 250);
  static const _staggerTime = Duration(milliseconds: 160);
  final _animationDuration = _initialDelayTime +
      (_staggerTime * _menuTitles.length) +
      Duration(milliseconds: 500);
  final List<Interval> _itemSlideIntervals = [];

  void _createAnimationIntervals() {
    for (var i = 0; i < _menuTitles.length; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 200),
        ..._createList(),
        const Spacer(),
      ],
    );
  }

  List<Widget> _createList() {
    final listItems = <Widget>[];
    for (var i = 0; i < _menuTitles.length; ++i) {
      listItems.add(
        AnimatedBuilder(
          animation: _staggeredController,
          builder: (context, child) {
            final animationPercent = Curves.easeOut.transform(
              _itemSlideIntervals[i].transform(_staggeredController.value),
            );
            final opacity = animationPercent;
            final slideDistance = (1.0 - animationPercent) * 150;

            return Opacity(
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(slideDistance, 0),
                child: child,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16),
            child: HoverText(
              _menuTitles[i],
              onPressed: () {
                widget.scrollController.animateTo(height*i, duration: Duration(milliseconds: 700), curve: Curves.fastOutSlowIn);
              },
            ),
          ),
        ),
      );
    }
    return listItems;
  }

  @override
  void initState() {
    super.initState();
    _createAnimationIntervals();

    _staggeredController =
        AnimationController(vsync: this, duration: _animationDuration)
          ..forward();
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [_buildContent()],
      ),
    );
  }
}
