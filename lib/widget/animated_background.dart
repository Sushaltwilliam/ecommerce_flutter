import 'package:flutter/material.dart';

class BackgroundAnimation extends StatefulWidget {
  const BackgroundAnimation({Key? key}) : super(key: key);

  @override
  _BackgroundAnimationState createState() => _BackgroundAnimationState();
}

class _BackgroundAnimationState extends State<BackgroundAnimation>
    with TickerProviderStateMixin {
  Color smalt = Color(0xff121856);
  Color oldRose = Color(0xffD2375);

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _animationController =
        AnimationController(duration: const Duration(seconds: 7), vsync: this)
            .repeat() as AnimationController;
    animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
  }

  late AnimationController _animationController;
  late Animation<double> animation;

  AlignmentTween alignmentTweenA =
      AlignmentTween(begin: Alignment.topRight, end: Alignment.topLeft);
  AlignmentTween alignmentTweenB =
      AlignmentTween(begin: Alignment.bottomRight, end: Alignment.bottomLeft);

  Animatable<Color> darkBackground = TweenSequence<Color>([
    TweenSequenceItem(
      weight: 0.5,
      tween: ColorTween(begin: Colors.purple, end: Colors.blueGrey)
          as Animatable<Color>,
    ),
    TweenSequenceItem(
      weight: 0.5,
      tween: ColorTween(begin: Colors.purple[200], end: Colors.blueGrey[200])
          as Animatable<Color>,
    ),
  ]);

  Animatable<Color> normalBackground = TweenSequence<Color>([
    TweenSequenceItem(
      weight: 0.5,
      tween: ColorTween(begin: Colors.purple[300], end: Colors.blueGrey[500])
          as Animatable<Color>,
    ),
    TweenSequenceItem(
      weight: 0.5,
      tween: ColorTween(begin: Colors.purple, end: Colors.blueGrey)
          as Animatable<Color>,
    ),
  ]);

  Animatable<Color> lightBackground = TweenSequence<Color>([
    TweenSequenceItem(
      weight: 0.5,
      tween: ColorTween(begin: Colors.purple[400], end: Colors.blueGrey[600])
          as Animatable<Color>,
    ),
    TweenSequenceItem(
      weight: 0.5,
      tween: ColorTween(begin: Colors.purple, end: Colors.blueGrey)
          as Animatable<Color>,
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: animation,
      builder: (ctx, child) {
        return Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: alignmentTweenA.evaluate(animation),
                  end: alignmentTweenB.evaluate(animation),
                  colors: [
                darkBackground.evaluate(animation),
                normalBackground.evaluate(animation),
                lightBackground.evaluate(
                  animation,
                )
              ])),
        );
      },
      child: Container(),
    );
  }
}
