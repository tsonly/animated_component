import 'package:flutter/material.dart';

class AnimatedComponent extends StatelessWidget {
  AnimationController controller;
  double iconSize = 20.0;
  EdgeInsets padding = EdgeInsets.all(16);
  Color color = Colors.white;
  Widget text;
  Widget icon;
  Decoration decoration;
  AnimatedComponent(this.controller, this.text, this.icon,
      {this.color, padding, this.decoration, iconSize})
      : top = AlignmentTween(begin: Alignment.centerLeft, end: Alignment.center)
            .animate(CurvedAnimation(
                curve: Interval(0.35, 1, curve: Curves.ease),
                parent: controller)),
        center = AlignmentTween(
                begin: Alignment.centerLeft, end: Alignment.topCenter)
            .animate(CurvedAnimation(
                curve: Interval(0.1, 0.65, curve: Curves.ease),
                parent: controller)),
        textBottom =
            AlignmentTween(begin: Alignment.center, end: Alignment.bottomCenter)
                .animate(CurvedAnimation(
                    curve: Interval(0, 0.8, curve: Curves.ease),
                    parent: controller)) {
    if (padding != null) this.padding = padding;
    if (iconSize != null) this.iconSize = iconSize;
  }

  final Animation<Alignment> top;
  final Animation<Alignment> center;
  final Animation<Alignment> textBottom;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, bigg) {
        Size size = bigg.biggest;
        return Container(
          decoration: decoration,
          padding: padding,
          width: size.width,
          height: size.height,
          color: color,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                alignment: center.value,
                width: size.width,
                child: Container(
                    height: iconSize,
                    width: size.width,
                    alignment: top.value,
                    child: icon),
              ),
              Container(
                //color: Colors.green,
                alignment: textBottom.value,
                child: Container(
                    //color: Colors.red,
                    width: size.width,
                    alignment: textBottom.value,
                    child: text),
              )
            ],
          ),
        );
      },
    );
  }
}
