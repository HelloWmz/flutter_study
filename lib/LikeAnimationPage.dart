import 'package:flutter/material.dart';

class LikeAnimationPage extends StatefulWidget {
  @override
  _LikeAnimationPageState createState() => new _LikeAnimationPageState();
}

class _LikeAnimationPageState extends State<LikeAnimationPage> {
  bool isShow=false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black45,
      appBar: new AppBar(
        title: new Text('点赞小动画'),
      ),
      body:Column(
        children: <Widget>[
          FlatButton(onPressed: (){
            setState(() {
              isShow=!isShow;
            });
          }, child: Text("显示动画",style: TextStyle(color: Colors.white,fontSize: 30),)),
          isShow?LikeWidget():Container()
        ],
      ),
    );
  }
}

class LikeWidget extends StatefulWidget {
  @override
  _LikeWidgetState createState() => new _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget> with TickerProviderStateMixin {
  AnimationController animationController1;
  AnimationController animationController2;
  AnimationController animationController3;
  Animation<double> animation1;
  Animation<double> animation2;
  Animation<double> animation3;
  Animation<double> currentanimation;
  Color currentColor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController1 =
        AnimationController(vsync: this, duration: Duration(microseconds: 500));
    animationController2 =
        AnimationController(vsync: this, duration: Duration(microseconds: 500));
    animationController3 =
        AnimationController(vsync: this, duration: Duration(microseconds: 80));
    currentColor = Colors.white;
    animation1 = Tween(begin: 1.0, end: 0.0).animate(animationController1)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (animation1.status == AnimationStatus.completed) {
          animationController2.forward(from: 0.0);
          currentanimation = animation2;
          currentColor = Colors.red;
        }
      });
    animation2 = Tween(begin: 0.0, end: 1.2).animate(animationController2)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (animation2.status == AnimationStatus.completed) {
          animationController3.forward(from: 0.0);
          currentanimation = animation3;
        }
      });
    animation3 = Tween(begin: 1.2, end: 1.0).animate(animationController3)
      ..addListener(() {
        setState(() {});
      });
    currentanimation = animation1;
    animationController1.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    print(currentanimation.value);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Icon(
            Icons.favorite,
            color: currentColor,
            size: currentanimation.value * 40,
          ),
        )
      ],
    );
  }
}
