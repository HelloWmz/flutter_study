import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'CounterProvider.dart';

class ProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Provider使用'),
        ),
        body: ChangeNotifierProvider.value(
            value: Counter(),
            child: Column(
              children: <Widget>[
                RowItem(),
                GridItem()
              ],
            )));
  }
}

class GridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return GridView.count(
      shrinkWrap: true,
      childAspectRatio: 1.2,
      crossAxisCount: counter.itemNum,
      children: List.generate(counter.totalNum, (index) {
        return Container(
          decoration: BoxDecoration(border: Border.all(width: 1)),
          alignment: Alignment.center,
          child: Text("${index + 1}"),
        );
      }),
    );
  }
}
class RowItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        RaisedButton(
          child: Text("3列9"),
          onPressed: () {
            counter.changeNum(9, 3);
          },
        ),
        RaisedButton(
          child: Text("4列 16"),
          onPressed: () {
            counter.changeNum(16, 4);
          },
        ),
        RaisedButton(
          child: Text("5 列 25"),
          onPressed: () {
            counter.changeNum(25, 5);
          },
        ),
      ],
    );
  }
}
