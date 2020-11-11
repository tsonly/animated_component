import 'package:flutter/material.dart';

import 'AnimationComponent.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Component(),
    );
  }
}

class Component extends StatefulWidget {
  @override
  _ComponentState createState() => _ComponentState();
}

class _ComponentState extends State<Component> with TickerProviderStateMixin {
  AnimationController stage1;

  var open = false;
  double height = 100.0;
  var top;
  var center;
  var textBottom;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stage1 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    top = AlignmentTween(begin: Alignment.centerLeft, end: Alignment.topLeft)
        .animate(CurvedAnimation(
            curve: Interval(0, 0.4, curve: Curves.ease), parent: stage1));
    center = AlignmentTween(begin: Alignment.topLeft, end: Alignment.topCenter)
        .animate(CurvedAnimation(
            curve: Interval(0.4, 1, curve: Curves.ease), parent: stage1));
    textBottom =
        AlignmentTween(begin: Alignment.center, end: Alignment.bottomCenter)
            .animate(CurvedAnimation(
                curve: Interval(0, 0.8, curve: Curves.ease), parent: stage1));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: GestureDetector(
        onTap: () async {
          try {
            open = !open;
            if (open) {
              await stage1.forward().orCancel;
            } else {
              await stage1.reverse().orCancel;
            }
          } catch (e) {
            print(e);
          }
        },
        child: Container(
          height: 100,
          margin: EdgeInsets.only(top: 30),
          child: AnimatedBuilder(
            builder: (ctx, child) {
              return AnimatedComponent(
                stage1,
                Text("Gerenciar Usuário"),
                Icon(
                  Icons.person,
                  size: 40,
                ),
                color: Colors.blue,
                padding: EdgeInsets.all(4),
                iconSize: 40.0,
              );
            },
            animation: stage1,
          ),
        ),
      ),
    );
  }
}
