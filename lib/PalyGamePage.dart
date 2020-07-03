import 'package:flutter/material.dart';

class PalyGamePage extends StatefulWidget {
  @override
  _PalyGamePageState createState() => new _PalyGamePageState();
}

class _PalyGamePageState extends State<PalyGamePage>
    with TickerProviderStateMixin {
  List<int> numDatas = List<int>();
  List<int> selectDatas = List<int>();
  List<AnimationController> animationControllers = List<AnimationController>();
  List<Animation<Color>> animations = List<Animation<Color>>();

  @override
  void initState() {
    super.initState();
    List.generate(16, (index) {
      numDatas.add(index + 1);
      animationControllers.add(AnimationController(
          vsync: this, duration: Duration(milliseconds: 500)));
      animations.add(ColorTween(begin: Colors.white, end: Colors.pink)
          .animate(animationControllers[index])
            ..addListener(() {
              setState(() {});
            }));
    });
    numDatas.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('舒尔特方格'),
      ),
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: animations[index].value,
              border: Border.all(width: 1),
            ),
            alignment: Alignment.center,
            child: FlatButton(
              onPressed: () {
                _clickNum(index);
              },
              child: Text("${numDatas[index]}"),
            ),
          );
        },
        itemCount: numDatas.length,
      ),
    );
  }

  _clickNum(int index) {
    int select = selectDatas.length > 0 ? selectDatas.last : 0;
    if (numDatas[index]-1 == select) {
      selectDatas.add(numDatas[index]);
      animations[index] = ColorTween(begin: Colors.white, end: Colors.pink)
          .animate(animationControllers[index])..addListener(() {
        setState(() {});
      });
    } else {
      animations[index] = ColorTween(begin: Colors.white, end: Colors.indigo)
          .animate(animationControllers[index])..addListener(() {
        setState(() {});
      });
    }

    animationControllers[index]
        .forward(from: 0.0)
        .then((value) => animationControllers[index].reverse());
  }
}
